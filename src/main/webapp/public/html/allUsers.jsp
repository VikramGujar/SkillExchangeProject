<%@ page import="java.util.Set" %>
<%@ page import="javabean.UserDataBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Set<UserDataBean> users = (Set<UserDataBean>) session.getAttribute("allUsers");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillExchange - Discover Users</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <style>
        .user-card {
            transition: transform 0.3s;
            margin-bottom: 20px;
        }
        .user-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .skill-badge {
            margin-right: 5px;
            margin-bottom: 5px;
        }
        .profile-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            border: 3px solid #6F69E8;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <h1 class="text-center mb-5">Discover SkillExchange Users</h1>

    <div class="row">
        <%
            if (users != null && !users.isEmpty()) {
                for (UserDataBean user : users) {
        %>
        <div class="col-md-4">
            <div class="card user-card h-100">
                <div class="card-body text-center">
                    <img 
                        src="<%= request.getContextPath() %>/userImage?username=<%= user.getUsername() %>" 
                        alt="Profile" 
                        class="profile-img mb-3"
                        onerror="this.onerror=null;this.src='../assets/image/default-profile.png';"
                    />
                    <h3 class="card-title"><%= user.getFname() %> <%= user.getLname() %></h3>
                    <p class="text-muted">@<%= user.getUsername() %></p>

                    <div class="mb-3">
                        <h5>Teaches:</h5>
                        <span class="badge bg-primary skill-badge">
                            <%= user.getSkillToTeach() %> (Level: <%= user.getRating() %>/10)
                        </span>
                    </div>

                    <div class="mb-3">
                        <h5>Wants to Learn:</h5>
                        <span class="badge bg-success skill-badge">
                            <%= user.getSkillToLearn() %>
                        </span>
                    </div>

                    <div class="d-flex justify-content-center">
                        <a href="mailto:<%= user.getEmail() %>" class="btn btn-outline-primary me-2">
                            <i class="bi bi-envelope"></i> Contact
                        </a>
                        <a href="https://wa.me/<%= user.getPhno() %>" class="btn btn-outline-success">
                            <i class="bi bi-whatsapp"></i> WhatsApp
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <div class="col-12">
            <div class="alert alert-info text-center">
                No users available to display.
            </div>
        </div>
        <% } %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
