package com.jspider.mvcproject1.service;

import java.util.List;

import com.jspider.mvcproject1.dto.EmployeeDto;

public interface EmployeeServiceInterface {

	EmployeeDto insert(String name,String email,String designation,String userName,String password);
	 EmployeeDto login(String userName, String password);
	 EmployeeDto remove(int id);
	 List<EmployeeDto> findAllEmployees();

	 EmployeeDto search(int id);
	void update(int id, String name, String email, String designation, String userName, String password);

}
