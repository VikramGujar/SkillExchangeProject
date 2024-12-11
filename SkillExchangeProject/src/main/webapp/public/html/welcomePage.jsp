<%@page import="javabean.UserDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDataBean ub=(UserDataBean)application.getAttribute("ubean");
	%>
	<h1>Welcome, <%=ub.getFname() %>! SkillExchange is your new playground for growth!</h1>
</body>
</html>