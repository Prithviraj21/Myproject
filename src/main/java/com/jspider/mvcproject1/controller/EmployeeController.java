package com.jspider.mvcproject1.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspider.mvcproject1.dto.EmployeeDto;
import com.jspider.mvcproject1.service.EmployeeService;

@Controller
public class EmployeeController {
	
	
	@Autowired
	private EmployeeService service;
	
	
	
	
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@PostMapping("/login")
	public String loginData(HttpSession session, HttpServletRequest request, @RequestParam String userName,@RequestParam String password,ModelMap map) {
		EmployeeDto emp=service.login(userName, password);
		if (emp!=null) {
			session=request.getSession();
			session.setAttribute("login", emp);
			session.setMaxInactiveInterval(300);
			return "homePage";
		}
		map.addAttribute("msg", "Invalid username or password");

		return "login";
		
	}
	
	@GetMapping("/insert")
	public String insertPage(ModelMap map, @SessionAttribute(name = "login", required = false) EmployeeDto login) {
		if (login != null) {
			return "insertEmployee";
		}
		map.addAttribute("msg", "Please login and try again..!!");
		return "loginPage";
	}
	

	@PostMapping("/insert")
	public String  insertData(@RequestParam String name, @RequestParam String email, @RequestParam String designation,
			@RequestParam String userName, @RequestParam String password, ModelMap map,
			@SessionAttribute(name = "login", required = false) EmployeeDto login) {
		if (login != null) {
			EmployeeDto employee = service.insert(name, email, designation, userName, password);
			if (employee != null) {
				map.addAttribute("msg", "Employee inserted successfully..!!");
				map.addAttribute("employee", employee);
				return "insertEmployee";
			}
			map.addAttribute("msg", "Employee record not inserted..!!");
			return "insertEmployee";
		}
		map.addAttribute("msg", "Please login and try again..!!");
		return "login";
	}
	
	@GetMapping("/search")
	public String searchPage(ModelMap map, @SessionAttribute(name = "login", required = false) EmployeeDto login) {
		if (login != null) {
			return "searchEmployee";
		}
		map.addAttribute("msg", "Please login and try again..!!");
		return "login";
	}

	@PostMapping("/search")
	public String searchData(@RequestParam int id, ModelMap map,
			@SessionAttribute(name = "login", required = false) EmployeeDto login) {
		if (login != null) {
			EmployeeDto employee = service.search(id);
			if (employee != null) {
				map.addAttribute("employee", employee);
			} else {
				map.addAttribute("msg", "Employee record not found..!!");
			}

			return "searchEmployee";
		}
		map.addAttribute("msg", "Please login and try again..!!");
		return "login";
	}

	@GetMapping("/remove")
	public String removePage(ModelMap map, @SessionAttribute(name = "login", required = false) EmployeeDto login) {
		if (login != null) {
			List<EmployeeDto> employees = service.findAllEmployees();
			map.addAttribute("employeeList", employees);

			return "removeEmployee";
		}
		map.addAttribute("msg", "Please login and try again..!!");
		return "login";
	}

	@PostMapping("/remove")
	public String removeData(@RequestParam int id, ModelMap map,
			@SessionAttribute(name = "login", required = false) EmployeeDto login) {
		if (login != null) {
			service.remove(id);
			map.addAttribute("msg", "Employee removed successfully..!!");

			List<EmployeeDto> employees = service.findAllEmployees();
			map.addAttribute("employeeList", employees);

			return "removeEmployee";
		}
		map.addAttribute("msg", "Please login and try again..!!");
		return "login";
	}

	@GetMapping("/update")
	public String updatePage(ModelMap map, @SessionAttribute(name = "login", required = false) EmployeeDto login) {
		if (login != null) {
			List<EmployeeDto> employees = service.findAllEmployees();
			map.addAttribute("employees", employees);
			return "updateEmployee";

		}
		map.addAttribute("msg", "Please login and try again..!!");
		return "login";
	}

	@PostMapping("/update")
	public String updateData(@RequestParam int id, ModelMap map,
			@SessionAttribute(name = "login", required = false) EmployeeDto login) {
		if (login != null) {
			EmployeeDto employee = service.search(id);
			if (employee != null) {
				map.addAttribute("employee", employee);
			}
			map.addAttribute("msg", "Employee record not found..!!");
			List<EmployeeDto> employees = service.findAllEmployees();
			map.addAttribute("employees", employees);
			return "updateEmployee";

		}
		map.addAttribute("msg", "Please login and try again..!!");
		return "login";
	}

	@PostMapping("/updateData")
	public String update(@RequestParam int id, @RequestParam String name, @RequestParam String email,
			@RequestParam String designation, @RequestParam String userName, @RequestParam String password,
			ModelMap map, @SessionAttribute(name = "login", required = false) EmployeeDto login) {
		if (login != null) {
			service.update(id, name, email, designation, userName, password);
			map.addAttribute("msg", "Employee updated successfully..!!");

			List<EmployeeDto> employees = service.findAllEmployees();
			map.addAttribute("employees", employees);
			return "updateEmployee";

		}
		map.addAttribute("msg", "Please login and try again..!!");
		return "login";
	}

	@GetMapping("/logout")
	public String logout(ModelMap map, HttpSession session) {
		session.invalidate();
		map.addAttribute("msg", "Successfully logged out..!!");
		return "login";
	}}