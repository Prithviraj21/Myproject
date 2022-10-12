<%@page import="com.jspider.mvcproject1.dto.EmployeeDto"%>
<%@page import="com.jspider.mvcproject1.dao.EmployeeDao"%>
<%@page import="com.jspider.mvcproject1.dto.LoginDto"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="navBar.jsp" />
<%
EmployeeDto emp = (EmployeeDto) request.getAttribute("emp");
%>
<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	if (msg != null) {
	%>
	<h3><%=msg%></h3>
	<%
	}
	%>

	<%
	if (emp != null) {
	%>


	<table border="1" style="text-align: center;">
		<tr>
			<th><label>Employee Id</label></th>
			<th><label>Employee name</label></th>
			<th><label>Employee email</label></th>
			<th><label>Employee designation</label></th>
			<th><label>Employee password</label></th>
			<th><label>Employee userName</label></th>
			
		</tr>
		<tr>
			<td><%=emp.getId()%></td>
		
			<td><%=emp.getName()%></td>
			<td><%=emp.getEmail()%></td>
			<td><%=emp.getDesignation()%></td>
			<td><%=emp.getPassword()%></td>
			<td><%=emp.getUserName()%></td>
			
			
			
			
		</tr>
		
	</table>
	<%
	}
	%>

</body>
</html>