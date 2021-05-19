package com.logsik.internal.service.impl;

import org.springframework.stereotype.Service;

@Service
public class FileStorageService extends AbstractFileStorageService {
	
	@Override
	protected String getFileStorageLocation() {
		return "./profileUpload";
	}
	
    
}
