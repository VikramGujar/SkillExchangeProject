<%@ page import="javabean.UserDataBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Welcome to SkillExchange</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../../src/style/welcomePage.css" />
</head>
<body>

<%
    // Session check
    if (session == null || session.getAttribute("userbean") == null) {
        response.sendRedirect(request.getContextPath() + "/public/html/userlogin.jsp");
        return;
    }

    // Get user data
    UserDataBean ub = (UserDataBean) session.getAttribute("userbean");
    String userName = ub.getUsername();
    long phNo = ub.getPhno();
    String destiny = (phNo == 0) ? "startJourneyForm.html" : request.getContextPath() + "/allUsersServlet";
%>

<!-- Navbar Section -->
<nav class="navbar fixed-top">
    <div class="container-fluid">
        <div class="navbar-brand d-flex justify-content-between w-100">
            <!-- Logo -->
            <div class="logo">
                <a href="#">
                    <img src="../assets/image/Header-logo.png" alt="Logo not found">
                </a>
            </div>

            <!-- Social Media Icons -->
            <div class="social-icons">
                <a href="https://www.facebook.com/" class="m-1"><img src="../assets/image/loged-In/media/facebook.svg" alt="Facebook"></a>
                <a href="https://www.instagram.com/" class="m-1"><img src="../assets/image/loged-In/media/instagram.svg" alt="Instagram"></a>
                <a href="https://www.linkedin.com/" class="m-1"><img src="../assets/image/loged-In/media/linkedin.svg" alt="LinkedIn"></a>
                <a href="https://x.com/twitter?lang=en" class="m-1"><img src="../assets/image/loged-In/media/twitter.svg" alt="Twitter"></a>
                <a href="https://www.youtube.com/" class="m-1"><img src="../assets/image/loged-In/media/youtube.svg" alt="YouTube"></a>
            </div>

            <!-- Menu Icon and Notification -->
            <div class="menu-icon d-flex justify-content-between h-25">
                <div class="notification-icon">
                    <a><img src="../assets/image/loged-In/notification.png" alt="Notification"></a>
                </div>
                <button class="navbar-toggler border-0" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </div>

        <!-- Offcanvas Menu -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>

                <div class="profile-pic p-2" style="width: 100px; height: 100px; border-radius: 50%; overflow: hidden; border: 2px solid #ccc; display: flex; align-items: center; justify-content: center; box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);">
                    <img src="<%=request.getContextPath()%>/userImage?username=<%=java.net.URLEncoder.encode(userName, "UTF-8")%>" 
                         alt="Profile Picture"
                         style="width: 150%; height: 120%; object-fit: cover; object-position: center;">
                </div>

                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Hi, <%= userName %></h5>
            </div>

            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/view?username=<%=userName%>">View Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="settingPage.html">Settings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="helpPage.html">Help</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-danger" href="<%=request.getContextPath()%>/logoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!-- Home Section -->
<section class="home w-100">
    <div class="container d-flex h-75 flex-column align-items-start justify-content-center gap-2">
        <div class="row">
            <div class="col-8">
                <h1 class="heading fw-bolder mb-5 text-break min-vw-100 w-75">
                    Share Your Knowledge.<br> Unlock Your Potential.
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <p class="w-75 description">
                    SkillExchange is a platform where users can teach what they know and learn what they don't, fostering a collaborative environment for skill-sharing and mutual growth, with a focus on personal and professional development.
                </p>
            </div>
        </div>

        <div class="row w-75 mt-1 btns">
            <div class="col-4 start-container">
                <a href="<%= destiny %>" class="btn border-0 btn-start rounded-pill fs-4 text-white px-4 py-1">Start Your Journey</a>
            </div>
            <div class="col-8 mt-1">
                <a href="about.html" class="btn btn-outline-light btn-lg rounded-pill fw-bold px-4 py-1">Learn More</a>
            </div>
        </div>
    </div>
</section>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
