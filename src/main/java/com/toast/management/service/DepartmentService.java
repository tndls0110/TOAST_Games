package com.toast.management.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.toast.management.dao.DepartmentDAO;

@Service
public class DepartmentService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final DepartmentDAO departmentDAO;
	
	public DepartmentService(DepartmentDAO departmentDAO) {
		this.departmentDAO = departmentDAO;
	}

}
