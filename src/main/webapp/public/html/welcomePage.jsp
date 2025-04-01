<%@ page import="com.nit.javabean.UserDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to SkillExchange</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../src/style/welcomePage.css" />


<!-- React Library -->
<script crossorigin
	src="https://unpkg.com/react@18/umd/react.development.js"></script>
<script crossorigin
	src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>

<!-- Compiler Library -->
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

</head>
<body>

	<!--------------------------------- JSP Code ------------------------------------------------->
	<%
	//Getting UserDataBean object
	UserDataBean ub = (UserDataBean) session.getAttribute("userbean");
	%>

	<!--------------------------------- Nav Section start------------------------------------------------->
	<nav class="navbar fixed-top">
		<div class="container-fluid">
			<!-- d-flex justify-content-between  -->
			<div class="navbar-brand d-flex justify-content-between w-100"
				href="#">
				<div class="logo">
					<a href="#"> <img alt="Logo not found"
						src="../assets/image/Header-logo.png">
					</a>
				</div>

				<div class="social-icons">
					<a href="https://www.facebook.com/" class="m-1"> <img
						src="../assets/image/loged-In/media/facebook.svg" alt="FaceBook">
					</a> <a href="https://www.instagram.com/" class="m-1"> <img
						src="../assets/image/loged-In/media/instagram.svg" alt="Instagram">
					</a> <a href="https://www.linkedin.com/" class="m-1"> <img
						src="../assets/image/loged-In/media/linkedin.svg" alt="LinkedIn">
					</a> <a href="https://x.com/twitter?lang=en" class="m-1"> <img
						src="../assets/image/loged-In/media/twitter.svg" alt="Twitter">
					</a> <a href="https://www.youtube.com/" class="m-1"> <img
						src="../assets/image/loged-In/media/youtube.svg" alt="YouTube">
					</a>
				</div>

				<div class="menu-icon d-flex justify-content-between h-25">
					<div class="notification-icon">
						<a> <img alt="Notification"
							src="../assets/image/loged-In/notification.png">
						</a>
					</div>
					<button class="navbar-toggler border border-0" type="button"
						data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
						aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
			</div>

			<!------------------------------------------------------------------------------------------------>

			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
					<div class="profile-pic p-2">
						<img alt="profile " src="../assets/image/loged-In/profile.png"
							width="70px">
					</div>
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel">
						Hi,
						<%
					out.println(ub.getUsername());
					%>
					</h5>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/view?username=<%=ub.getUsername()%>">View
								Profile</a></li>

						<a class="nav-link"
							href="<%=request.getContextPath()%>/viewEditUserPro?username=<%=ub.getUsername()%>">
							Edit Profile </a>


						<a class="nav-link setting" href="#">Settings</a>
						<ul class="setting-options" style="display: none;">
							<li><a href="changePass.jsp" class="change-password">Change
									Password</a></li>
						</ul>

						<style>
.change-password {
	color: black;
	text-decoration: none;
}

.change-password:hover {
	color: darkgray;
}
</style>

						<script>
							document.getElementsByClassName("setting")[0]
									.addEventListener(
											"click",
											function(event) {
												event.preventDefault(); // Prevent default anchor action
												let menu = document
														.querySelector(".setting-options");
												menu.style.display = (menu.style.display === "none") ? "block"
														: "none";
											});
						</script>

						<li class="nav-item"><a class="nav-link" href="#">Help</a></li>
						<li><a class=" btn btn-outline-danger" href="logout">Logout</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--------------------------------- Nav Section end------------------------------------------------->

	<!--------------------------------- Header Section ------------------------------------------------->
	<!---------------------------------- Home Section  ------------------------->

	<section class="home w-100">
		<div
			class="container d-flex h-75 flex-column align-items-start align-content-center justify-content-center gap-2 ">
			<div class="row ">
				<div class="col-8">
					<h1 class="heading fw-bolder mb-5 min-vw-100 w-75 text-break">
						Share Your Knowledge.<br> Unlock Your Potential.
					</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<p class="w-50 w-75 description">SkillExchange is a platform
						where users can teach what they know and learn what they don't,
						fostering a collaborative environment for skill-sharing and mutual
						growth, with a focus on personal and professional development.</p>
				</div>
			</div>
			<%
			// out.println(ub.getSkillToLearn());

			String userAction = ub.getSkillToLearn() == null ? "startJourneyForm.html" : "../../showAllUsers";
			%>

			<form action=<%=userAction%> method="post" class="row w-75 mt-1 btns">
				<div class="col-4 start-container">
					<input type="submit" value="Start Your Journey"
						class="btn  border-0 btn-start rounded-pill fs-4 text-white px-4 py-1" />
				</div>
				<div class="col-8 mt-1">
					<a href="#about"
						class="btn btn-outline-light btn-lg rounded-pill fw-bold px-4 py-1">Learn
						More</a>
				</div>
			</form>

			<!-- 
		<div class="row w-75 mt-1 btns">
			<div class="col-4 start-container">
					<a href="coonnectToUsers.html" class="btn  border-0 btn-start rounded-pill fs-4 text-white px-4 py-1">Start Your Journey</a>
			</div>
			<div class="col-8 mt-1">
					<a href="#about" class="btn btn-outline-light btn-lg rounded-pill fw-bold px-4 py-1">Learn More</a>
			</div>
		</div>
		 -->

			<!-- 
			<h1 class="slogun">Share Your Knowledge. Unlock Your Potential.</h1>
			<p class="lead mb-4 home-paragraph">SkillExchange is a platform
				where users can teach what they know and learn what they don't,
				fostering a collaborative environment for skill-sharing and mutual
				growth, with a focus on personal and professional development.</p>
			<div class="home-buttons">
				<a href="#start" class="btn btn-primary btn-lg me-3">Start Your Journey</a> 
				<a href="#about" class="btn btn-outline-light btn-lg">Learn More</a>
			</div> -->

		</div>
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


	<!-- React Application Library -->
	<script type="text/babel">
		funtion FormForButtons(){
			return (
			
			);
		}
	</script>
	<noscript>Please enable JavaScript on your browser.</noscript>

</body>
</html>
