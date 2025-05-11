<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="javabean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel="icon" type="image/x-icon"
	href="public/assets/image/profile/fav-img.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="src/style/ViewUserProfile.css" />

</head>
<body>
	<header class="h-25 w-100">
		<img class="w-100 z-0 img" alt="Background Image"
			src="public/assets/image/profile/profile-bg.jpg">
	</header>

	<%
	UserDataBean msg = (UserDataBean) request.getAttribute("user");
	String userName= msg.getUsername();
	%>
	<div
		class="container p-5 w-75 shadow p-3 pt-0 pb-5 mb-5 bg-light outer-container">
		<!-- outer container start-->
		<div class="container pt-0 text-x">
			<!-- inner container start -->
			<div
				class="row profile-pic shadow p-3 mb-5 bg-body-tertiary rounded mx-auto p-2">
				<img alt="Profile picture"
					src="<%=request.getContextPath()%>/userImage?username=<%=java.net.URLEncoder.encode(userName, "UTF-8")%>" />
			</div>

			<!-- <h1>Update User</h1> -->

			<form action="update" method="post" enctype="multipart/form-data">
				<div class="row px-3 py-1.1 mt-1">
					<div class="col-4">
						<label class="fs-4">First Name</label>
					</div>
					<div class="col-8">
						<input type="text" class="w-100 px-2 py-1 fs-5 border"
							class="w-100 px-2 py-1 fs-5 border" name="fname"
							value="<%=msg.getFname()%>">
					</div>
				</div>
				<div class="row px-3 py-1.1 mt-1">
					<div class="col-4">
						<label class="fs-4">LastName</label>
					</div>
					<div class="col-8">
						<input type="text" class="w-100 px-2 py-1 fs-5 border"
							name="lname" id="lname" value="<%=msg.getLname()%>">
					</div>
				</div>
				<div class="row px-3 py-1.1 mt-1">
					<div class="col-4">
						<label class="fs-4">Username</label>
					</div>
					<div class="col-8">
						<input type="text" class="w-100 px-2 py-1 fs-5 border"
							name="uname" id="uname" readonly="readonly"
							value="<%=msg.getUsername()%>">
					</div>
				</div>
				<div class="row px-3 py-1.1 mt-1">
					<div class="col-4">

						<label class="fs-4">Email</label>
					</div>
					<div class="col-8">
						<input type="text" class="w-100 px-2 py-1 fs-5 border"
							name="email" id="email" value="<%=msg.getEmail()%>">
					</div>
				</div>
				<div class="row px-3 py-1.1 mt-1">
					<div class="col-4">
						<label class="fs-4">Phone Number</label>
					</div>
					<div class="col-8">
						<input type="text" class="w-100 px-2 py-1 fs-5 border" name="phno"
							id="phno" value="<%=msg.getPhno()%>">
					</div>
				</div>

				<div class="row px-3 py-1.1 mt-1">
					<div class="col-4">
						<label class="fs-4">Select Profile Image</label>
					</div>
					<div class="col-8">
						<input type="file" class="w-100 px-2 py-1 fs-5 border"
							name="profileImage" id="profileImage" accept=".jpg, .jpeg, .png">
					</div>
				</div>

				<div class="row text-center">
					<div class="col pt-2">
						<input type="submit" class="btn mt-4 " value="Update Profile">
					</div>
				</div>

			</form>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>