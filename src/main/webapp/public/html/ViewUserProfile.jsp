<%@page import="javabean.UserDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
.msg {
	color: rgb(0, 0, 200);
	font-size: 15px;
	text-align: center;
	margin-left: -90px;
}
</style>
</head>
<body>
	<header class="h-25 w-100">
		<img class="w-100 z-0 img" alt="Background Image"
			src="public/assets/image/profile/profile-bg.jpg">
	</header>

	<%
	ArrayList<UserDataBean> al = (ArrayList<UserDataBean>) request.getAttribute("profile");
	String msg = (String) request.getAttribute("msg");
	String userName = null;

	for (UserDataBean user : al)
		userName = user.getUsername();
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


			<%
			for (UserDataBean view : al) {
			%>
			<%
			if (msg != null) {
			%>
			<h2 class="msg"><%=msg%></h2>
			<%
			}
			%>

			<%
			if (al != null) {
			%>
			<div class="row px-3 py-1.1 mt-1">
				<div class="col-4">
					<div class="fs-4">First Name</div>
				</div>
				<div class="col-8">
					<div class="w-100 px-2 py-1 fs-5 border">
						<%=view.getFname()%>
					</div>
				</div>
			</div>
			<div class="row px-3 py-1.1 mt-1">
				<div class="col-4">
					<div class="fs-4">Last Name</div>
				</div>
				<div class="col-8">
					<div class="w-100 px-2 py-1 fs-5 border">
						<%=view.getLname()%>
					</div>
				</div>
			</div>
			<div class="row px-3 py-1.1 mt-1">
				<div class="col-4">
					<div class="fs-4">User Name</div>
				</div>
				<div class="col-8">
					<div class="w-100 px-2 py-1 fs-5 border">
						<%=view.getUsername()%>
					</div>
				</div>
			</div>
			<div class="row px-3 py-1.1 mt-1">
				<div class="col-4">
					<div class="fs-4">Mobile number</div>
				</div>
				<div class="col-8">
					<div class="w-100 px-2 py-1 fs-5 border">
						<%=view.getPhno()%>
					</div>
				</div>
			</div>
			<div class="row px-3 py-1.1 mt-1">
				<div class="col-4">
					<div class="fs-4">Email</div>
				</div>
				<div class="col-8">
					<div class="w-100 px-2 py-1 fs-5 border">
						<%=view.getEmail()%>
					</div>
				</div>
			</div>
			<div class="row text-center">
				<div class="col pt-2">
					<a
						href="showEditUserPro?username=<%=java.net.URLEncoder.encode(view.getUsername(), "UTF-8")%>"><button
							class="btn mt-4 ">Update Profile</button></a>
				</div>
			</div>
			<%
			} // end of if
			%>
			<%
			} // end of for each loop
			%>
		</div>
		<!-- inner conatiner end-->
	</div>
	<!-- outer container end-->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>
