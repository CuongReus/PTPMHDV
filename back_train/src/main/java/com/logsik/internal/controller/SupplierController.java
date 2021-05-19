package com.logsik.internal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.logsik.internal.domain.Supplier;
import com.logsik.internal.dtos.RestResult;
import com.logsik.internal.repository.SupplierRepository;
import com.logsik.internal.service.impl.DtoConverter;

@RestController
@RequestMapping("/api")
public class SupplierController extends AbstractController {
	private static final Logger LOGGER = LoggerFactory.getLogger(SupplierController.class);

	@Autowired
	private SupplierRepository supplierRepository;

	@Autowired
	private DtoConverter dtoConverter;

	@RequestMapping("supplier/{id}")
	public RestResult findById(@PathVariable(value = "id") Long id) {
		return new RestResult(supplierRepository.findOne(id));
	}

	@RequestMapping(value = "/supplier/add", method = RequestMethod.POST)
	public RestResult add(@RequestBody Supplier supplier) {
		try {
			Supplier newSupplier = supplierRepository.save(supplier);

			return new RestResult(newSupplier);
		} catch (Exception e) {
			LOGGER.error("Error when adding contract.", e);
			return new RestResult(true, MESSAGE_CANNOT_SAVE);
		}
	}

	@RequestMapping(value = "/supplier/update", method = RequestMethod.POST)
	public RestResult update(@RequestBody Supplier supplier) {
		try {
			Supplier source = supplierRepository.findOne(supplier.getId());

			Supplier updatedcontract = supplierRepository.save(dtoConverter.fillSupplierForm(source, supplier));

			return new RestResult(updatedcontract);
		} catch (Exception e) {
			LOGGER.error("Error when updating supplier.", e);
			return new RestResult(true, MESSAGE_CANNOT_SAVE);
		}
	}

	@DeleteMapping("/supplier/{id}")
	public RestResult deletecontract(@PathVariable("id") Long id) throws Exception {
		System.out.println("Delete contract with ID = " + id + "...");

		try {
			supplierRepository.delete(id);
		} catch (Exception e) {
			LOGGER.error("Error when delete supplier.", e);
			return new RestResult(true, MESSAGE_CANNOT_DELETE);
		}
		return new RestResult("ok");
	}

	@RequestMapping(value = "/supplier/list")
	public RestResult list(@RequestParam("search") String search, Pageable pageable) {
		Object result;
		if (search == null) {
			result = supplierRepository.findAll(pageable);
		}else {
			result = supplierRepository.findByNameContainingOrProductProvideNameContaining(search,search,pageable);
		}
	
		return new RestResult(result);
	}

	@RequestMapping(value = "/supplier/listAll")
	public RestResult listAll() {
		return new RestResult(supplierRepository.findAll());

	}
}
