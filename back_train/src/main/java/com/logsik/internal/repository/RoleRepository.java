package com.logsik.internal.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.logsik.internal.domain.Role;


public interface RoleRepository extends BaseRepository<Role, Long> {
	Page<Role> findAll(Pageable pageable);
	Role findOne(Long id);
	

}
