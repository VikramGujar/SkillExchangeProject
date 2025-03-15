<%@page import="javabean.UserDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>User Profile</title>
    <link rel="icon" type="image/x-icon" href="public/assets/image/profile/fav-img.png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="../../src/style/ViewUserProfile.css"/>
    
</head>
<body>
	 <header class="h-25 w-100">
        <div class="container bg-light"> <!-- outer caontainer start-->
            <div class="container"> <!-- inner container start -->
                <div class="row">
                    <div class="col">
                        <label for="">Name </label>
                    </div>
                    <div class="col">
                        <input type="text">
                    </div>
                </div>
            </div> <!-- inner conatiner end-->
        </div> <!-- outer container end-->
    </header>
	
	
	

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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
