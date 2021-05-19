package com.logsik.internal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.logsik.internal.domain.Role;
import com.logsik.internal.dtos.RestResult;
import com.logsik.internal.repository.RoleRepository;
import com.logsik.internal.service.impl.DtoConverter;

@RestController
@RequestMapping("/api")
public class RoleController extends AbstractController {
	private static final Logger LOGGER = LoggerFactory.getLogger(Role.class);

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private DtoConverter dtoConverter;

	@RequestMapping("role/{id}")
	public RestResult findById(@PathVariable(value = "id") Long id) {

		return new RestResult(roleRepository.findOne(id));
	}

	@RequestMapping(value = "/role/add", method = RequestMethod.POST)
	@PreAuthorize("hasAuthority('ADMIN')")
	public RestResult add(@RequestBody Role role) {
		try {
			Role newRole = roleRepository.save(role);

			return new RestResult(newRole);
		} catch (Exception e) {
			LOGGER.error("Error when adding contract.", e);
			return new RestResult(true, MESSAGE_CANNOT_SAVE);
		}
	}

	@RequestMapping(value = "/role/update", method = RequestMethod.POST)
	@PreAuthorize("hasAuthority('ADMIN')")
	public RestResult update(@RequestBody Role role) {
		try {
			Role source = roleRepository.findOne(role.getId());

			Role updatedRole = roleRepository.save(dtoConverter.fillRoleForm(source, role));

			return new RestResult(updatedRole);
		} catch (Exception e) {
			LOGGER.error("Error when updating role.", e);
			return new RestResult(true, MESSAGE_CANNOT_SAVE);
		}
	}

	@DeleteMapping("/role/{id}")
	public RestResult deleteRole(@PathVariable("id") Long id) {
		System.out.println("Delete contract with ID = " + id + "...");

		try {
			roleRepository.delete(id);
		} catch (Exception e) {
			LOGGER.error("Error when delete role.", e);
			return new RestResult(true, MESSAGE_CANNOT_DELETE);
		}

		return new RestResult("ok");
	}

	@RequestMapping(value = "/role/list")
//	@PreAuthorize("hasAuthority('ADMIN')")
	public RestResult list(@RequestParam("search") Long search, Pageable pageable) {
		Object result;
			result = roleRepository.findAll(pageable);
		return new RestResult(result);
	}

	@RequestMapping(value = "/role/listAll")
//	@PreAuthorize("hasAuthority('ADMIN')")
	public RestResult listAll() {
		return new RestResult(roleRepository.findAll());

	}

}
