<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.jspider.mvcproject1.dto.LoginDto"%>
<%String b="Trainee"; %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
ul{
list-style-type: none;
background-color: black;
overflow: hidden;
margin: 0px;
background-color: #333;
}
li{
float: right;
}
li a {
display: black;
margin: 0px;
padding: 15px;
}

li a:hover {
	background-color: #111;
}
 
</style>
</head>
<body>
<% if(LoginDto.des.equals(b)){%>
<ul>
<li><a style="color:white;" href="./search">Search Employee</a>
<li><a style="color:white;" href="./insert">Insert Employee</a>
<li><a style="color:white;" href="./update">Update Employee</a>
<li><a style="color:white;" href="./remove">Remove Employee</a>
<li><a style="color:white;" href="./logout">Logout</a>

</ul>
<%}
else{ %>
<ul>
<li><a style="color:white;" href="./search">Search Employee</a>
<li><a style="color:white;" href="./update">Update Details  </a>
<li><a style="color:white;" href="./logout">Logout</a>

</ul>
<%} %>
</body>
</html>