<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.jspider.mvcproject1.dto.EmployeeDto"%>
<%@page import="com.jspider.mvcproject1.dao.EmployeeDao"%>
<%@page import="com.jspider.mvcproject1.dto.LoginDto"%>
	
<jsp:include page="navBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management</title>
</head>
<body>
	<fieldset>
		<legend>::: Insert Employee Details:::</legend>
		<form action="./insert" method="post">
			<table>
				<tr>
					<td><label>Name</label></td>
					<td><input type="text" name="name"
						placeholder="Employee Full Name"></td>
				</tr>

				<tr>
					<td><label>Email</label></td>
					<td><input type="email" name="email"
						placeholder="Employee Email"></td>
				</tr>
				<tr>
					<td><label>Designation</label></td>
					<td><input type="text" name="designation"
						placeholder="Employee Designation"></td>
				</tr>

				<tr>
					<td><label>Username</label></td>
					<td><input type="text" name="userName"
						placeholder="Employee Username"></td>
				</tr>
				
				<tr>
					<td><label>Password</label></td>
					<td><input type="password" name="password"
						placeholder="Employee password"></td>
				</tr>
				
				<tr><td><input type="submit" name="Submit"><td/></tr>
			</table>
		</form>
	</fieldset>
</body>
</html>