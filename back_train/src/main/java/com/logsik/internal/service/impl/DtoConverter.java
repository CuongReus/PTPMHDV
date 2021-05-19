package com.logsik.internal.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logsik.internal.domain.Company;
import com.logsik.internal.domain.FileUpload;
import com.logsik.internal.domain.Role;
import com.logsik.internal.domain.Supplier;
import com.logsik.internal.domain.User;
import com.logsik.internal.domain.UserRole;
import com.logsik.internal.dtos.UploadFileResponse;
import com.logsik.internal.dtos.UserDto;

/**
 * Created by phamcongbang on 10/04/2018.
 */
@Service
public class DtoConverter {
	@Autowired
	private ModelMapper modelMapper;

	// Never map to Hibernate entity with modelMapper, map wrong id to any field
	// xxxId, password is empty
	public User convertToUser(UserDto userDto) {
		User user = new User();
		return fillUserForm(user, userDto);
	}


	public User fillUserForm(User user, UserDto userDto) {
		user.setEmail(userDto.getEmail());
		user.setImage(userDto.getImage());
		user.setLabourContract(userDto.getLabourContract());
		user.setLeaveDayYear(userDto.getLeaveDayYear());
		user.setCompany(userDto.getCompany());
		user.setDepartment(userDto.getDepartment());
		user.setFullName(userDto.getFullName());
		user.setPhone(userDto.getPhone());
		user.setRole(userDto.getRole());
		user.setAddress(userDto.getAddress());
		user.setBirthday(userDto.getBirthday());
		user.setActive(userDto.isActive());
		user.setIdentityCardNumber(userDto.getIdentityCardNumber());
		user.setIssuedAt(userDto.getIssuedAt());
		user.setIssuedDate(userDto.getIssuedDate());
		user.setGender(userDto.getGender());
		user.setPermanentAddress(userDto.getPermanentAddress());
		user.setCurrentAddress(userDto.getCurrentAddress());
		user.setStartWorkDate(userDto.getStartWorkDate());
		user.setPosition(userDto.getPosition());
		user.setNumberOfYear(userDto.getNumberOfYear());
		user.setJobDescription(userDto.getJobDescription());
		user.setDegree(userDto.getDegree());
		user.setTrainingPlace(userDto.getTrainingPlace());
		user.setProfession(userDto.getProfession());
		user.setGraduationYear(userDto.getGraduationYear());
		user.setForeignLanguageSkill(userDto.getForeignLanguageSkill());
		user.setLevel(userDto.getLevel());
		user.setFamilyInformation(userDto.getFamilyInformation());
		user.setCode(userDto.getCode());
		user.setCreatedUserEmail(userDto.getCreatedUserEmail());
		user.setLastedUpdateUserEmail(userDto.getLastedUpdateUserEmail());
		if (user.getRoles() != null) {
			user.getRoles().clear();
			for (Role role : userDto.getRoles()) {
				user.getRoles().add(role);
			}
		} else {
			user.setRoles(userDto.getRoles());
		}

		return user;
	}

//****************************User File & Image******************************
	public UserDto convertToUserDto(User user, List<FileUpload> profiles, List<FileUpload> imageUpload) {
		UserDto dto = modelMapper.map(user, UserDto.class);
		dto.setImageUpload(
				imageUpload.stream().map(file -> convertToUploadUserImage(file)).collect(Collectors.toList()));
		dto.setProfiles(
				profiles.stream().map(file -> convertToUploadUserProfile(file)).collect(Collectors.toList()));
		return dto;
	}

	private UploadFileResponse convertToUploadUserProfile(FileUpload file) {
		return new UploadFileResponse(file.getName(), "/api/downloadUserProfile/" + file.getName(), null,
				file.getSize(),file.getUploadBy());
	}

	private UploadFileResponse convertToUploadUserImage(FileUpload file) {
		return new UploadFileResponse(file.getName(), "/api/downloadUserImage/" + file.getName(), null, file.getSize(), file.getUploadBy());
	}

//******************************End User File & Image******************************


	public Company fillCompanyForm(Company destination, Company form) {
		modelMapper.map(form, destination);
		return destination;
	}



	public Role fillRoleForm(Role destination, Role form) {
		modelMapper.map(form, destination);
		return destination;
	}

	public UserRole fillUserRoleForm(UserRole destination, UserRole form) {
		modelMapper.map(form, destination);
		return destination;
	}
	
	public Supplier fillSupplierForm(Supplier destination, Supplier form) {
		modelMapper.map(form, destination);
		return destination;
	}


}
