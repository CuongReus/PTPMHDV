package com.logsik.internal.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.logsik.internal.domain.Company;

public interface CompanyRepository extends BaseRepository<Company, Long> {
	Page<Company> findAll (Pageable pageable);
	List<Company> findById(Long id);
	Page<Company> findByNameContainingOrCodeContaining(String name, String code,Pageable pageable);
	
}
