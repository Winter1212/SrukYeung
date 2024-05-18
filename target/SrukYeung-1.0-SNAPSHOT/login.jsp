
<%@ page import="Beans.Dbconnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="Beans.users" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login </title>
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
String phoneNumber = request.getParameter("phone");
String password = request.getParameter("password");
int userId;
String error = "";
boolean isLoggedIn = false;

// Check if the form has been submitted
if (request.getMethod().equalsIgnoreCase("get")) {
    Dbconnection dbc = new Dbconnection();
    Connection conn = null;
    String sql = "SELECT * FROM tblusers WHERE phoneNumber = ?";
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
  
    try {
        // Establish database connection
        conn = dbc.getConnection();
        stmt = conn.prepareStatement(sql);   
        stmt.setString(1, phoneNumber);

        // Execute the query and retrieve the results
        rs = stmt.executeQuery();

        // Check if a user with the provided phone number exists
        if (rs.next()) {
            // If a user exists, check if the password matches
            if (password.equals(rs.getString("password"))) {
                users user = new users(
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("sex"),
                    rs.getString("dob"),
                    rs.getString("email"),
                    rs.getString("phoneNumber"),
                    rs.getString("password"),
                    rs.getString("address")
                );
                userId = rs.getInt("userId");

                // Store user information in session
                session.setAttribute("user", user);
                session.setAttribute("userId", userId);
                isLoggedIn = true;
                session.setAttribute("isLoggedIn",isLoggedIn);
            } else {
                // Password doesn't match, display error message
                error = "Incorrect phone number or password!";
            }
        } 
        
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle database errors
     }finally {
        // Close database resources
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
%>

<div class="container">
    <div class="row justify-content-center login-container align-items-center"">
        <div class="col-md-6 center-form">
            <h2 class="text-center">Login</h2>
            <h5 class="text-center">To Booking you need to log in.</h5>
            
            <form action="#" method="get">
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter Phone number" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                    <% if (isLoggedIn ) { %>
                        <div class="alert alert-success text-center" role="alert">
                            <p>Login successful!</p>
                        </div>
                        <script>
                        // Set a delay of 3 seconds (3000 milliseconds) before redirecting
                        setTimeout(function() {
                        window.location.href = "index.jsp";
                        }, 3000); 
                        </script>
                    <% 
                            } else if(error != null && !error.isEmpty()) { %>
                        <div class="alert alert-danger" role="alert">
                            <p>
                            <%= error %>
                            </p>
                        </div>
                    <% } %>
             
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="userRegisterform.jsp">Sign Up</a></p>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
