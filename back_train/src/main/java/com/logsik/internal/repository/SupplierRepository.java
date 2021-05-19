package com.logsik.internal.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.logsik.internal.domain.Supplier;

public interface SupplierRepository extends BaseRepository<Supplier, Long> {

	Page<Supplier> findById(Long id, Pageable pageable);

	Page<Supplier> findAll(Pageable pageable);
	
	Page<Supplier> findByNameContainingOrProductProvideNameContaining(String name,String productProvideName,Pageable pageable);

	Supplier findOne(Long id);

	List<Supplier> findAll();
	
//	List<Supplier> findByProductProvideNameContaining(String productProvideName);


}
