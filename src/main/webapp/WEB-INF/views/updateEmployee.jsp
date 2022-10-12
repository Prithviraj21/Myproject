<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.jspider.mvcproject1.dto.EmployeeDto"%>
<%@page import="com.jspider.mvcproject1.dao.EmployeeDao"%>
<%@page import="com.jspider.mvcproject1.dto.LoginDto"%>


<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="navBar.jsp" />
<%
String msg = (String) request.getAttribute("msg");
%>
<%
List<EmployeeDto> employees = (List<EmployeeDto>) request.getAttribute("employees");
%>
<%
EmployeeDto employee = (EmployeeDto) request.getAttribute("employee");
%>
<%String b="Trainee"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management</title>
<style type="text/css">
fieldset table {
	margin: auto;
	text-align: left;
}
fieldset {
	margin: 15px 520px;
	text-align: center;
}
legend {
	color: white;
	background-color: #333;
}
</style>
</head>
<body>

<%
	if (LoginDto.des.equals(b)) {
	%>
	<%
	if (employee != null) {
	%>
	<form action="./updateData" method="post">
		<fieldset>
			<legend></legend>
			<table>
				<tr hidden="true">
					<td><label>ID</label></td>
					<td><input type="text" name="id" value="<%=employee.getId()%>"></td>
				</tr>
				<tr>
					<td><label>Name</label></td>
					<td><input type="text" name="name"
						value="<%=employee.getName()%>"></td>
				</tr>
				<tr>
					<td><label>Email</label></td>
					<td><input type="text" name="email"
						value="<%=employee.getEmail()%>"></td>
				</tr>
				<tr>
					<td><label>Designation</label></td>
					<td><input type="text" name="designation"
						value="<%=employee.getDesignation()%>"></td>
				</tr>
				<tr>
					<td><label>Username</label></td>
					<td><input type="text" name="userName"
						value="<%=employee.getUserName()%>"></td>
				</tr>
				<tr>
					<td><label>Password</label></td>
					<td><input type="text" name="password"
						value="<%=employee.getPassword()%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="UPDATE"></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<%
	} else {
	%>
	<form action="./update" method="post">
		<fieldset>
			<legend>:::Select Employee To Update:::</legend>
			<table>
				<tr>
					<td><label>ID</label></td>
					<td><input type="text" name="id"
						placeholder="Enter ID to update details"></td>
				</tr>
				<tr>
					<td><input type="submit" value="SELECT"></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<%
	if (employees != null) {
	%>

	<%
	if (msg != null) {
	%>
	<h3 style="text-align: center; color: red;"><%=msg%>
	</h3>
	<%
	}
	%>
	<table style="width: 100%;">
		<tr>
			<td>
				<h3>ID</h3>
			</td>
			<td><h3>Name</h3></td>
			<td>
				<h3>Designation</h3>
			</td>
			<td>
				<h3>Email</h3>
			</td>
			<td>
				<h3>Username</h3>
			</td>
			<td>
				<h3>Password</h3>
			</td>
		</tr>
		<%
		for (int i = 0; i < employees.size(); i++) {
		%>

		<tr>
			<td><%=employees.get(i).getId()%></td>
			<td><%=employees.get(i).getName()%></td>
			<td><%=employees.get(i).getDesignation()%></td>
			<td><%=employees.get(i).getEmail()%></td>
			<td><%=employees.get(i).getUserName()%></td>
			<td><%=employees.get(i).getPassword()%></td>
		</tr>

		<%
		}
		%>

	</table>
	<%
	}
	}
	%>
	
	<%
	}else{
	
	%>
	
		<form action="./updateData" method="post">
		<fieldset>
			<legend></legend>
			<table>
				<tr hidden="true">
					<td><label>ID</label></td>
					<td><input type="text" name="id" value="<%=LoginDto.id%>"></td>
				</tr>
				<tr>
					<td><label>Name</label></td>
					<td><input type="text" name="name"
						value="<%=LoginDto.name%>"></td>
				</tr>
				<tr>
					<td><label>Email</label></td>
					<td><input type="text" name="email"
						value="<%=LoginDto.email%>"></td>
				</tr>
				<tr>
					<td><label>Designation</label></td>
					<td><input type="text" name="designation"
						value="<%=LoginDto.des%>"></td>
				</tr>
				<tr>
					<td><label>Username</label></td>
					<td><input type="text" name="userName"
						value="<%=LoginDto.userName%>"></td>
				</tr>
				<tr>
					<td><label>Password</label></td>
					<td><input type="text" name="password"
						value="<%=LoginDto.password%>"></td>
				</tr>
				<tr>
					<td><input type="submit" value="UPDATE"></td>
				</tr>
			</table>
		</fieldset>
	</form>
	
	
	<%
	if (employees != null) {
	%>

	<%
	if (msg != null) {
	%>
	<h3 style="text-align: center; color: red;"><%=msg%>
	</h3>
	<%
	}
	%>
	<table style="width: 100%;">
		<tr>
			<td>
				<h3>ID</h3>
			</td>
			<td><h3>Name</h3></td>
			<td>
				<h3>Designation</h3>
			</td>
			<td>
				<h3>Email</h3>
			</td>
			<td>
				<h3>Username</h3>
			</td>
			<td>
				<h3>Password</h3>
			</td>
		</tr>
		

		<%
		for (int i = 0; i < employees.size(); i++) {
		%>

		<tr>
			<td><%=employees.get(i).getId()%></td>
			<td><%=employees.get(i).getName()%></td>
			<td><%=employees.get(i).getDesignation()%></td>
			<td><%=employees.get(i).getEmail()%></td>
			<td><%=employees.get(i).getUserName()%></td>
			<td><%=employees.get(i).getPassword()%></td>
		</tr>

		<%
		}
		%>
		

	</table>
	<%
	}
	}
	
	%>
			
	
		
	

</body>
</html>