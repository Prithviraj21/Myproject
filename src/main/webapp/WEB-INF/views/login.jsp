<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<fieldset>
		<legend>::: Log In:::</legend>
		<form action="./login" method="post">
			<table>
				<tr>
					<td><label>Username</label></td>
					<td><input type="text" name="userName" placeholder=" Username"></td>
				</tr>
				<tr>
					<td><label>Password</label></td>
					<td><input type="password" name="password"
						placeholder=" password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="LogIn"></td>
				</tr>

			</table>

		</form>
	</fieldset>
</body>
</html>