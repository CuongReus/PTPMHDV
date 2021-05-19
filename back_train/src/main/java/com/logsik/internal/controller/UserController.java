package com.logsik.internal.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.logsik.internal.config.AuthorizationServerConfig;
import com.logsik.internal.config.BCrypt;
import com.logsik.internal.domain.FileUpload;
import com.logsik.internal.domain.User;
import com.logsik.internal.dtos.RestResult;
import com.logsik.internal.dtos.UploadFileResponse;
import com.logsik.internal.dtos.UserDto;
import com.logsik.internal.queries.PersonelSpecification;
import com.logsik.internal.repository.CompanyRepository;
import com.logsik.internal.repository.FileUploadRepository;
import com.logsik.internal.repository.UserRepository;
import com.logsik.internal.service.impl.DtoConverter;
import com.logsik.internal.service.impl.UserServiceImpl;

@RestController
@RequestMapping("/api")
@Transactional
public class UserController extends AbstractController {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
	private static final String DUPLICATE_EMAIL = "Không Được Trùng Email";
	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private FileUploadRepository fileUploadRepository;
	@Autowired
	private CompanyRepository companyRepository;

	@Autowired
	private DtoConverter dtoConverter;

	@Autowired
	private TokenStore tokenStore;

	@Autowired
	private AuthorizationServerConfig authorizationServerConfig;

	@RequestMapping("user/{id}")
	public RestResult findById(@PathVariable(value = "id") Long id) {
		checkAuthorization("admin.users.read");
		User user = userRepository.findOne(id);
		List<FileUpload> profiles = fileUploadRepository.findByCrmTableNameAndCrmLinkId("UserLabourContract",
				user.getId());
		List<FileUpload> imageUpload = fileUploadRepository.findByCrmTableNameAndCrmLinkId("UserImage", user.getId());
		return new RestResult(dtoConverter.convertToUserDto(user, profiles, imageUpload));
	}

	@RequestMapping(value = "/user/add", method = RequestMethod.POST)
	public RestResult addUser(@RequestBody UserDto userDto) {
		checkAuthorization("admin.users.create");
		try {
			User user = dtoConverter.convertToUser(userDto); // TODO: Hash password error
			user.setPassword(BCrypt.hashpw(userDto.getPassword(), BCrypt.gensalt()));
			User newUser = userService.save(user);
			saveNewUserProfileFiles(newUser, userDto.getProfiles());
			saveNewUserImage(newUser, userDto.getImageUpload());
			return new RestResult(newUser);
		} catch (Exception e) {
			LOGGER.error("Error when adding user.", e);
			return new RestResult(true, DUPLICATE_EMAIL);
		}
	}

	private void saveNewUserProfileFiles(User user, List<UploadFileResponse> profiles) {
		for (UploadFileResponse file : profiles) {
			FileUpload userFile = new FileUpload();
			userFile.setName(file.getFileName());
			userFile.setFileLocation(file.getFileDownloadUri());
			userFile.setSize(file.getSize());
			userFile.setCrmLinkId(user.getId());
			userFile.setCrmTableName("UserLabourContract");
			userFile.setUploadBy(user.getCreatedUserEmail());
//			Set Profile into database to Download and show in List Screen
			userFile.setUploadBy(user.getCreatedUserEmail());
			user.setLabourContract(file.getFileDownloadUri());
			fileUploadRepository.save(userFile);
		}
	}

	private void saveNewUserImage(User user, List<UploadFileResponse> imageUpload) {
		for (UploadFileResponse file : imageUpload) {
			FileUpload userFile = new FileUpload();
			userFile.setName(file.getFileName());
			userFile.setFileLocation(file.getFileDownloadUri());
			userFile.setSize(file.getSize());
			userFile.setCrmLinkId(user.getId());
			userFile.setCrmTableName("UserImage");
			userFile.setUploadBy(user.getCreatedUserEmail());
			user.setImage(file.getFileDownloadUri());
			fileUploadRepository.save(userFile);
		}
	}

	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public RestResult updateUser(@RequestBody UserDto userDto) {
		checkAuthorization("admin.users.update");
		try {
			User user = userRepository.findOne(userDto.getId());
			if (!StringUtils.isEmpty(userDto.getPassword())) {
				user.setPassword(BCrypt.hashpw(userDto.getPassword(), BCrypt.gensalt()));
			}
			User updatedUser = userService.save(dtoConverter.fillUserForm(user, userDto));
//			if (!StringUtils.isEmpty(userDto.getPassword())) {
//				authorizationServerConfig.removeRefreshToken(user.getEmail());
//			}
			updateUserProfile(updatedUser, userDto.getProfiles());
			updateUserImage(updatedUser, userDto.getImageUpload());
			return new RestResult(updatedUser);
		} catch (Exception e) {
			LOGGER.error("Error when updating.", e);
			return new RestResult(true, DUPLICATE_EMAIL);
		}
	}
	
	@RequestMapping(value = "/user/changePassword", method = RequestMethod.POST)
	public RestResult changePassword(@RequestBody UserDto userDto) {
		if (!userDto.getId().equals(getCurrentUser().getId())) {
			return new RestResult(true, FORBIDDEN_ACCESS);
		}
		try {	
			User user = userRepository.findOne(userDto.getId());
			if (!StringUtils.isEmpty(userDto.getPassword())) {
				user.setPassword(BCrypt.hashpw(userDto.getPassword(), BCrypt.gensalt()));
			}
			User updatedUser = userService.save(user);
			authorizationServerConfig.removeRefreshToken(user.getEmail());
			return new RestResult(updatedUser);
		} catch (Exception e) {
			LOGGER.error("Error when updating user for taman.", e);
			return new RestResult(true, DUPLICATE_EMAIL);
		}
	}

	// Update labour contract
	private void updateUserProfile(User user, List<UploadFileResponse> newProfiles) {
		List<FileUpload> currentUserFiles = fileUploadRepository.findByCrmTableNameAndCrmLinkId("UserLabourContract",
				user.getId());
		List<String> currentProfiles = currentUserFiles.stream().map(e -> e.getFileLocation())
				.collect(Collectors.toList());
		List<String> newProfilesString = newProfiles.stream().map(e -> e.getFileName()).collect(Collectors.toList());
		for (FileUpload userFile : currentUserFiles) {
			if (!newProfilesString.contains(userFile.getName())) {
				fileUploadRepository.delete(userFile);
			}

		}
		for (UploadFileResponse newFile : newProfiles) {
			if (!currentProfiles.contains(newFile.getFileDownloadUri())) {
				FileUpload userFile = new FileUpload();
				userFile.setCrmTableName("UserLabourContract");
				userFile.setCrmLinkId(user.getId());
				userFile.setName(newFile.getFileName());
				userFile.setFileLocation(newFile.getFileDownloadUri());
				userFile.setSize(newFile.getSize());
				user.setLabourContract(newFile.getFileDownloadUri());
				userFile.setUploadBy(user.getLastedUpdateUserEmail());
				fileUploadRepository.save(userFile);
			} else if (currentProfiles.contains(newFile.getFileDownloadUri())) {
				LOGGER.error("Duplicate File Name");
			}
		}

	}
	// End Update Labour ContractController

	// Update User Image
	private void updateUserImage(User user, List<UploadFileResponse> newImage) {
		List<FileUpload> currentUserFiles = fileUploadRepository.findByCrmTableNameAndCrmLinkId("UserImage",
				user.getId());
		List<String> currentImage = currentUserFiles.stream().map(e -> e.getFileLocation())
				.collect(Collectors.toList());
		List<String> newImageString = newImage.stream().map(e -> e.getFileName()).collect(Collectors.toList());
		for (FileUpload userFile : currentUserFiles) {
			if (!newImageString.contains(userFile.getName())) {

				fileUploadRepository.delete(userFile);

			}

		}
		for (UploadFileResponse newFile : newImage) {
			if (!currentImage.contains(newFile.getFileDownloadUri())) {
				FileUpload userFile = new FileUpload();
				userFile.setCrmTableName("UserImage");
				userFile.setCrmLinkId(user.getId());
				userFile.setName(newFile.getFileName());
				userFile.setFileLocation(newFile.getFileDownloadUri());
				userFile.setSize(newFile.getSize());
				userFile.setSize(newFile.getSize());
				user.setImage(newFile.getFileDownloadUri());
				userFile.setUploadBy(user.getCreatedUserEmail());
				fileUploadRepository.save(userFile);
			} else if (currentImage.contains(newFile.getFileDownloadUri())) {
				LOGGER.error("Duplicate File Name");
			}

		}

	}

	// End Update User Image
	// DeleteMapping
	@DeleteMapping("/user/{id}")
	public RestResult deleteUser(@PathVariable("id") Long id) {
		checkAuthorization("admin.users.delete");
		LOGGER.info("Delete User with ID = " + id);

		try {
			userRepository.delete(id);
		} catch (Exception e) {
			LOGGER.error("Error when delete User.", e);
			return new RestResult(true, MESSAGE_CANNOT_SAVE);
		}

		return new RestResult("ok");
	}

	@RequestMapping(value = "/user/findByCompanyIdAndFullNameOrPhoneOrEmail")
//    @PreAuthorize("hasAuthority('ADMIN')")
	public RestResult listFindByCompanyIdAndFullNameOrPhoneOrEmail(@RequestParam("companyId") String companyId,@RequestParam("fullNameOrPhoneOrEmail") String fullNameOrPhoneOrEmail, Pageable pageable) {
		checkAuthorization("admin.users.read");
//		Object result = null;
		Page<User> result = userRepository.findAll(new PersonelSpecification(companyId, fullNameOrPhoneOrEmail),pageable);
		
		return new RestResult(result);
	}
//	 public Predicate toPredicate(Root<Pet> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
//         Join<Pet, Owner> owners = root.join("owners");
//         criteriaQuery.orderBy(criteriaBuilder.desc(root.get("id")));
//         return criteriaBuilder.equal(owners.get("name"), ownerName);
//     }
	@RequestMapping(value = "/user/listAll")
	public RestResult listAll() {
		return new RestResult(userRepository.findAll());
	}

}
