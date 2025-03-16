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
<body>
<%
UserDataBean msg=(UserDataBean)request.getAttribute("user");
%>

<h1>Update Product</h1>
<div class="form-container">
    <form action="update" method="post">
        <p>
            <label for="fname">FirstName</label>
            <input type="text" name="fname" id="fname"   value="<%=msg.getFname()%>">
        </p>
        <p>
            <label for="lname">LastName</label>
            <input type="text" name="lname" id="lname" value="<%=msg.getLname()%>">
        </p>
        <p>
            <label for="username">Username</label>
            <input type="text" name="uname" id="price" readonly="readonly" value="<%=msg.getUsername()%>">
        </p>
        <p>
            <label for="email">Email</label>
            <input type="text" name="email" id="email" value="<%=msg.getEmail()%>">
        </p>
        <p>
            <label for="phno">Phone Number</label>
            <input type="text" name="phno" id="phno" value="<%=msg.getPhno()%>">
        </p>
        <input type="submit" value="Update">
    </form>
</div>
</body>
</html>