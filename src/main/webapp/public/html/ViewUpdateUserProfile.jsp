<%@page import="com.nit.javabean.UserDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
</head>
<body>

<% 
    ArrayList<UserDataBean> al = (ArrayList<UserDataBean>) request.getAttribute("profile");
    String msg = (String) request.getAttribute("msg");
%>

<% if (msg != null && !msg.isEmpty()) { %>
    <h2 style="color:red;"><%= msg %></h2>
<% } %>

<% if (al != null && !al.isEmpty()) { %>
    <h2>User Details</h2>
    <table border="1" width="80%">
        <tr align="center">
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
            <th>Email</th>
            <th>Phone No</th>
            <!-- <th>Profile Photo</th> --><!-- image -->
            <th>Operation</th>
        </tr>
        <% for (UserDataBean view : al) { %>
        <tr align="center">
            <td><%= view.getFname() %></td>
            <td><%= view.getLname() %></td>
            <td><%= view.getUsername() %></td>
            <td><%= view.getEmail() %></td>
            <td><%= view.getPhno() %></td>
            <td><a href="showEditUserPro?username=<%= URLEncoder.encode(view.getUsername(), "UTF-8") %>">Edit</a></td>
        </tr>
        <% } %>
    </table>
<% } else { %>
    <h2>No User Data Found</h2>
<% } %>

</body>
</html>