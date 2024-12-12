package com.toast.management.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeeDAO {

	int employeeAdd(Map<String, String> param);
	
}
