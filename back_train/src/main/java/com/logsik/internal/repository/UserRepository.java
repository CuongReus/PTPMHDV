package com.logsik.internal.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.logsik.internal.domain.User;
import com.logsik.internal.enums.UserRole;

import org.springframework.data.jpa.domain.Specification;
public interface UserRepository extends BaseRepository<User, Long>, JpaSpecificationExecutor<User> {
	@EntityGraph(attributePaths = { "company", "roles"})
	List<User> findByEmail(String email);
	@EntityGraph(attributePaths = { "company","roles"})
	Page<User> findByEmailContaining(String email, Pageable pageable);
	
	@EntityGraph(attributePaths = { "company","roles"})
	Page<User> findByFullNameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(String fullName,String email,String phone,String address, Pageable pageable);
	
	@EntityGraph(attributePaths = { "company","roles"})
	Page<User> findByRole(UserRole role, Pageable pageable);
	@EntityGraph(attributePaths = { "company","roles"})
	List<User> findByFullName(String fullName);
	@EntityGraph(attributePaths = { "company","roles"})
	Page<User> findByRoleAndEmailContaining(UserRole role, String email, Pageable pageable);
	@EntityGraph(attributePaths = { "company","roles"})
	Page<User> findAll(Specification<User> spec,Pageable pageable);
	
	@EntityGraph(attributePaths = { "company","roles"})
	List<User> findAll();
	
	//Load Data on form
	@EntityGraph(attributePaths = { "company","roles"})
	User findOne(Long id);

}
