package com.jspider.mvcproject1.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jspider.mvcproject1.dto.EmployeeDto;
import com.jspider.mvcproject1.dto.LoginDto;

@Repository
public class EmployeeDao implements EmployeeDaoInterface {
	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	static EmployeeDto emp;

	public static void openConnection() {
		factory = Persistence.createEntityManagerFactory("MVCPROJECT");
		manager = factory.createEntityManager();
		transaction = manager.getTransaction();
	}

	public static void closeConnection() {
		if (factory != null) {
			factory.close();

		}
		if (manager != null) {
			manager.close();

		}

	}

	@Override
	public EmployeeDto insert(String name, String email, String designation, String userName, String password) {
		openConnection();
		transaction.begin();  
		EmployeeDto emp = new EmployeeDto();
		emp.setName(name);
		emp.setEmail(email);
		emp.setDesignation(designation);
		emp.setUserName(userName);
		emp.setPassword(password);
		manager.persist(emp);
		transaction.commit();
		closeConnection();
		return emp;
	}

	@Override
	public EmployeeDto login(String userName, String password) {
		openConnection();
		transaction.begin();
		String query = "from EmployeeDto where userName='" + userName + "'and password='" + password + "'";
		Query q = manager.createQuery(query);
		try {
			 emp = (EmployeeDto) q.getSingleResult();
			 LoginDto.des=emp.getDesignation();
			 LoginDto.name = emp.getName();
			 LoginDto.email=emp.getEmail();
			 LoginDto.userName=emp.getUserName();
			 LoginDto.password=emp.getPassword();
			 LoginDto.id=emp.getId();
			System.out.println(emp);
			if (emp != null) {
				transaction.commit();
				closeConnection();
				return emp;

			}

		} catch (Exception e) {
			closeConnection();
			return null;

		}
		return null;

	}

	@Override
	public void remove(int id) {
		openConnection();

		transaction.begin();

		EmployeeDto employee = manager.find(EmployeeDto.class, id);

		manager.remove(employee);

		transaction.commit();

		closeConnection();

	}

	@Override
	public List<EmployeeDto> findAllEmployees() {
		openConnection();

		transaction.begin();

		String jpql = "from EmployeeDto";

		Query query = manager.createQuery(jpql);
		List<EmployeeDto> list = query.getResultList();

		transaction.commit();

		closeConnection();

		return list;
	}
//
	@Override
	public EmployeeDto search(int id) {
		openConnection();

		transaction.begin();

		EmployeeDto find = manager.find(EmployeeDto.class, id);
		transaction.commit();
		closeConnection();

		return find;
	}

	@Override
	public void update(int id, String name, String email, String designation, String userName, String password) {
		openConnection();
		transaction.begin();
		EmployeeDto employee = manager.find(EmployeeDto.class, id);
		employee.setName(name);
		employee.setEmail(email);
		employee.setDesignation(designation);
		employee.setUserName(userName);
		employee.setPassword(password);
		manager.persist(employee);
		transaction.commit();
		closeConnection();		
	}

}
