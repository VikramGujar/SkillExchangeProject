<%@ page import="javabean.UserDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>All User</title>
		<link
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
		rel="stylesheet" />
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
			crossorigin="anonymous">
		<link rel="stylesheet" href="../../src/style/allUsers.css" />
		
		
	    <!-- React Library -->
	    <script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
	    <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
	
	    <!-- Compiler Library -->
	    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
	
	</head>
	<body>
	<!--------------------------------- Nav Section start------------------------------------------------->
	<nav class="navbar fixed-top">
		<div class="container-fluid">
			<!-- d-flex justify-content-between  -->
			<div class="navbar-brand d-flex justify-content-between w-100" href="#">
				<div class="logo">
					<a href="#"> 
						<img alt="Logo not found" src="public/assets/image/Header-logo.png">
					</a>
				</div> 	

				<form action="sortUsers" method="POST">
				
				</form>
				
				
				<div class="menu-icon d-flex justify-content-between h-25">
					<div class=""></div>
				</div>
			</div>

			<!------------------------------------------------------------------------------------------------>

		</div>
	</nav>
	<!--------------------------------- Nav Section end------------------------------------------------->

		
	
	
	
	
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