package com.logsik.internal.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.logsik.internal.domain.Role;
import com.logsik.internal.domain.UserRole;


public interface UserRoleRepository extends BaseRepository<UserRole, Long> {
	Page<UserRole> findAll(Pageable pageable);
	UserRole findOne(Long id);
	

}
