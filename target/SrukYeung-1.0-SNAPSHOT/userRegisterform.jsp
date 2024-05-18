<%-- 
    Document   : userRigisterform
    Created on : May 11, 2024, 11:20:26 AM
    Author     : Noy
--%>
<%@ page import="Beans.Dbconnection" %>
<%@ page import="Beans.users" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Form</title>
         <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    </head>
<body>
    <% 
//     
     if (request.getMethod().equalsIgnoreCase("post")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String sex = request.getParameter("sex");
            String dob = request.getParameter("dob");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phone");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
  
            String redirectURL = "index.jsp" ;

            users user = new users(firstName, lastName, sex, dob, email, phoneNumber,password, address);
            user.insertUser(user);

            out.println("<script type='text/javascript'>");
            out.println("alert('User registered successfully!');");
            out.println("window.location.href='" + redirectURL + "';");
            out.println("</script>");
        }
    

   
    %>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="header">
          <h2 class="text-center">User Registration</h2>
          <p>Welcome to Sruk Yeung. Please fill in the form below to register to our services.</p>
        </div>
          <form action="userRegisterform.jsp" method="post">
          <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter first name">
          </div>
          <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter last name">
          </div>
          <div class="form-group">
            <label for="sex">Sex</label>
            <select class="form-control" id="sex" name="sex">
              <option value="male">Male</option>
              <option value="female">Female</option>
            </select>
          </div>
          <div class="form-group">
            <label for="dob">Date of Birth</label>
            <input type="date" class="form-control" id="dob" name="dob">
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
          </div>
          <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter phone number">
          </div>
               <div class="form-group">
            <label for="phone">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
          </div>
          <div class="form-group">
            <label for="address">Address</label>
            <textarea class="form-control" id="address" rows="3" name="address" placeholder="Enter address"></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>
  </div>
  <!-- Bootstrap JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

