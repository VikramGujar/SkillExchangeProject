<%@page import="javabean.UserDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>
	<%
	ArrayList<UserDataBean> al = (ArrayList<UserDataBean>) request.getAttribute("profile");
	String msg = (String) request.getAttribute("msg");
	%>

	<%
	if (msg != null) {
	%>
	<h2><%=msg%></h2>
	<%
	}
	%>

	<%
	if (al != null) {
	%>
	<h2>User Details</h2>
	<table border="1" width="80%">
		<tr align="center">
			<th>First Name</th>
			<th>Last Name</th>
			<th>Username</th>
			<th>Email</th>
			<th>Phone No</th>
		</tr>
		<%
		for (UserDataBean view : al) {
		%>
		<tr align="center">
			<td><%=view.getFname()%></td>
			<td><%=view.getLname()%></td>
			<td><%=view.getUsername()%></td>
			<td><%=view.getEmail()%></td>
			<td><%=view.getPhno()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	}
	%>

</body>
</html>
