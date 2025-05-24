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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- custom styles here -->
    <style>
        :root {
            --primary-color: #6F69E8;
            --secondary-color: #FB4899;
            --bg-light: #f8f9fa;
            --text-dark: #333;
            --card-shadow: 0 10px 30px rgba(111, 105, 232, 0.15);
            --card-shadow-hover: 0 15px 35px rgba(111, 105, 232, 0.25);
        }
        
        body {
            background-color: var(--bg-light);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .discover-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 4rem 0;
            margin-bottom: 3rem;
            position: relative;
            overflow: hidden;
        }
        
        .discover-header::before {
            content: '';
            position: absolute;
            bottom: -50px;
            left: 0;
            width: 100%;
            height: 100px;
            background: var(--bg-light);
            transform: skewY(-3deg);
            z-index: 1;
        }
        
        .discover-title {
            position: relative;
            z-index: 2;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
        }
        
        .search-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: var(--card-shadow);
            margin-bottom: 3rem;
        }
        
        .user-card {
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            margin-bottom: 2rem;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
            position: relative;
        }
        
        .user-card:hover {
            transform: translateY(-10px);
            box-shadow: var(--card-shadow-hover);
        }
        
        .user-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }
        
        .profile-img-container {
            width: 120px;
            height: 120px;
            margin: 30px auto 1rem;
            position: relative;
            z-index: 2;
        }
        
        .profile-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border: 5px solid white;
            border-radius: 50%;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        
        .user-card:hover .profile-img {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        
        .user-name {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .username {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }
        
        .skill-section {
            margin-bottom: 1.5rem;
        }
        
        .skill-title {
            font-size: 1rem;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-weight: 600;
        }
        
        .skill-badge {
            border-radius: 20px;
            padding: 0.5rem 1rem;
            font-weight: 500;
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
            display: inline-block;
        }
        
        .teaches-badge {
            background: rgba(111, 105, 232, 0.1);
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }
        
        .learns-badge {
            background: rgba(251, 72, 153, 0.1);
            color: var(--secondary-color);
            border: 1px solid var(--secondary-color);
        }
        
        .rating-stars {
            color: #FFD700;
            margin-left: 5px;
        }
        
        .action-buttons {
            margin-top: 1.5rem;
        }
        
        .btn-contact {
            border-radius: 50px;
            padding: 0.5rem 1.25rem;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-email {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
        }
        
        .btn-email:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(111, 105, 232, 0.3);
            color: white;
        }
        
        .btn-whatsapp {
            background: white;
            color: #25D366;
            border: 1px solid #25D366;
        }
        
        .btn-whatsapp:hover {
            background: #25D366;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(37, 211, 102, 0.3);
        }
        
        .no-users {
            background: white;
            border-radius: 15px;
            padding: 3rem;
            text-align: center;
            box-shadow: var(--card-shadow);
        }
        
        .no-users-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .back-to-home-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            z-index: 1000;
            transition: all 0.3s ease;
        }
        
        .back-to-home-btn:hover {
            transform: translateY(-5px) scale(1.1);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            color: white;
        }
        
        @media (max-width: 768px) {
            .profile-img-container {
                width: 100px;
                height: 100px;
                margin-top: -50px;
            }
            
            .back-to-home-btn {
                width: 50px;
                height: 50px;
                font-size: 1.2rem;
                bottom: 20px;
                right: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header class="discover-header text-center">
        <div class="container">
            <h1 class="discover-title display-4 fw-bold mb-3">Discover SkillExchange Users</h1>
            <p class="lead">Connect with fellow learners and teachers in our community</p>
        </div>
    </header>

    <div class="container">
        <!-- Search and Filter Section -->
        <div class="search-container mb-5">
            <div class="row">
                <div class="col-md-8">
                    <input type="text" class="form-control form-control-lg" placeholder="Search by name, skill, or username...">
                </div>
                <div class="col-md-4">
                    <select class="form-select form-select-lg">
                        <option selected>Filter by Skill</option>
                        <option>Programming</option>
                        <option>Design</option>
                        <option>Languages</option>
                        <option>Music</option>
                        <option>Other</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- User Cards Grid -->
        <div class="row">
            <%
                if (users != null && !users.isEmpty()) {
                    for (UserDataBean user : users) {
                    	if(user.getSkillToLearn()!=null)
                    	{
            %>
            <div class="col-lg-4 col-md-6">
                <div class="card user-card h-100">
                    <div class="card-body text-center">
                        <div class="profile-img-container">
                            <img 
                                src="<%= request.getContextPath() %>/userImage?username=<%= user.getUsername() %>" 
                                alt="Profile" 
                                class="profile-img"
                                onerror="this.onerror=null;this.src='../assets/image/default-profile.png';"
                            />
                        </div>
                        <h3 class="user-name"><%= user.getFname() %> <%= user.getLname() %></h3>
                        <p class="username">@<%= user.getUsername() %></p>

                        <div class="skill-section">
                            <h5 class="skill-title">Teaches</h5>
                            <span class="skill-badge teaches-badge">
                                <%= user.getSkillToTeach() %>
                            </span>
                        </div>

                        <div class="skill-section">
                            <h5 class="skill-title">Wants to Learn</h5>
                            <span class="skill-badge learns-badge">
                                <%= user.getSkillToLearn() %>
                            </span>
                        </div>

                        <div class="rating-section">
                            <h5 class="skill-title">Rating</h5>
                            <div class="rating-stars">
                                <% for (int i = 0; i < user.getRating(); i++) { %>
                                    <i class="bi bi-star-fill"></i>
                                <% } %>
                                <% for (int i = user.getRating(); i < 10; i++) { %>
                                    <i class="bi bi-star"></i>
                                <% } %>
                            </div>
                        </div>

                        <div class="action-buttons">
                            <a href="mailto:<%= user.getEmail() %>" class="btn btn-contact btn-email">
                                <i class="bi bi-envelope-fill"></i> Email
                            </a>
                            <a href="https://wa.me/<%= user.getPhno() %>" target="_blank" class="btn btn-contact btn-whatsapp">
                                <i class="bi bi-whatsapp"></i> WhatsApp
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    	} }
                } else {
            %>
            <div class="col-12">
                <div class="no-users">
                    <div class="no-users-icon"><i class="bi bi-person-x-fill"></i></div>
                    <h4>No users found!</h4>
                    <p>It looks like no users are currently available.</p>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <!-- Back to Home Floating Button -->
    <a href="home.jsp" class="back-to-home-btn" title="Back to Home">
        <i class="bi bi-house-door-fill"></i>
    </a>

    <!-- Bootstrap JS (optional but recommended for components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
