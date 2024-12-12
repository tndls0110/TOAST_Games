package com.toast.management.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.toast.management.service.EmployeeService;

@Controller
public class EmployeeController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PasswordEncoder encoder;
	
	private final EmployeeService employeeService;
	
	public EmployeeController(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	@GetMapping(value="/employeeAdd.go")
	public String employeeAddGo() {
		
		return "employee_add";
	}
	
	@PostMapping(value="/employeeAdd.do")
	public String employeeAddDo(@RequestParam Map<String,String> param) {
		
		String pw = param.get("empl_pw");
		
		String encodepw = encoder.encode(pw);
		
		param.put("empl_pw", encodepw);
		
		return "";
	}
}
