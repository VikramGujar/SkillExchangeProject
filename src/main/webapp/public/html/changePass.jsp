<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Change Password</h2>
	<form action="change" method="post">
		<p>
			<label for="opass">Username</label> <input type="text" id="opass"
				name="uname" required placeholder="Enter Username">
		</p>
		<p>
			<label for="opass">Old Password</label> <input type="text" id="opass"
				name="opass" required placeholder="Enter Old Password">
		</p>
		<p>
			<label for="npass">New Password</label> <input type="text" id="npass"
				name="npass" required placeholder="Enter New Password">
		</p>
		<input type="submit" value="Change">
	</form>
	<p>
		<button>
			<a href="welcomePage.jsp">Back</a>
		</button>
	</p>
</body>
</html>