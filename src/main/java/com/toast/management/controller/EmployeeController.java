package com.toast.management.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.toast.management.service.EmployeeService;

@Controller
public class EmployeeController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final EmployeeService employeeService;
	
	public EmployeeController(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

}
