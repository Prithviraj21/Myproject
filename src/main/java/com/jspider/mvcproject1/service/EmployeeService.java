package com.jspider.mvcproject1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspider.mvcproject1.dao.EmployeeDao;
import com.jspider.mvcproject1.dto.EmployeeDto;

@Service
public class EmployeeService implements EmployeeServiceInterface {

	@Autowired
	private EmployeeDao dao;

	@Override
	public EmployeeDto insert(String name, String email, String designation, String userName, String password) {

		EmployeeDto emp = dao.insert(name, email, designation, userName, password);

		return emp;
	}

	@Override
	public EmployeeDto login(String userName, String password) {
		EmployeeDto emp = dao.login(userName, password);
		if (emp!=null) {
			return emp;
			
		}

		return null;
	}

	@Override
	public EmployeeDto remove(int id) {
		EmployeeDto employee = dao.search(id);
		if (employee != null) {
			dao.remove(id);
			return employee;
		}
		return null;

	}

	@Override
	public List<EmployeeDto> findAllEmployees() {
		List<EmployeeDto> employees = dao.findAllEmployees();
		return employees;
	}

	@Override
	public EmployeeDto search(int id) {
		EmployeeDto employee = dao.search(id);
		return employee;
	}

	@Override
	public void update(int id, String name, String email, String designation, String userName, String password) {
		dao.update(id, name, email, designation, userName, password);
		
	}



}
