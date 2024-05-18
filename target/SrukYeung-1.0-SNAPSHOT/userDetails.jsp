<%-- 
    Document   : userDetails
    Created on : May 15, 2024, 2:45:20 PM
    Author     : Noy
--%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="Beans.Dbconnection" %>
<%@ page import="Beans.users" %>
  <%@ page import="javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Details</title>
        <style>
        body {
            background-color: #f8f9fa;
        }

        .user-details-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
            animation: fadeIn 1s ease-in-out; /* Add animation */
        }

        .user-details-container h2 {
            margin-bottom: 30px;
            text-align: center;
        }

        .user-details-container .form-group {
            margin-bottom: 20px;
        }

        .user-details-container label {
            font-weight: bold;
        }
       .form-group {
    border-bottom: 1px solid gray;
}

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
  
    </head>
   <body>
    <div class="user-details-container">
        <h2>User Details</h2>
        <% 
            boolean isLoggedIn = false; // Default value
            Object isLoggedInObj = session.getAttribute("isLoggedIn");
    
            if (isLoggedInObj != null && isLoggedInObj instanceof Boolean) {
                isLoggedIn = (Boolean) isLoggedInObj; // Cast to boolean
                if(isLoggedIn){
                    users user = (users) session.getAttribute("user");
                    if (user != null) {
        %>
         <div class="form-group">
            <label>User Id:</label>
            <p><%= session.getAttribute("userId") %></p>
        </div>
        <div class="form-group">
            <label>First Name:</label>
            <p><%= user.getFirstName() %></p>
        </div>
        <div class="form-group">
            <label>Last Name:</label>
            <p><%= user.getLastName() %></p>
        </div>
        <div class="form-group">
            <label>Sex:</label>
            <p><%= user.getSex() %></p>
        </div>
        <div class="form-group">
            <label>Date of Birth:</label>
            <p><%= user.getDob() %></p>
        </div>
        <div class="form-group">
            <label>Email:</label>
            <p><%= user.getEmail() %></p>
        </div>
        <div class="form-group">
            <label>Phone:</label>
            <p><%= user.getPhoneNumber() %></p>
        </div>
        <div class="form-group">
            <label>Address:</label>
            <p><%= user.getAddress() %></p>
        </div>
        <% 
                    }
                }
            }
        %>
    </div>
</body>
</html>
