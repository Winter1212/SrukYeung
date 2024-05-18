<%@ page import="Beans.Dbconnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="Beans.users" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <style>
        #bookingCard {
            display: none;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

</head>
<body>
<%
    // Parse the query parameter to get the room type
    String roomType = request.getParameter("room");
    int numberOfGuest = Integer.parseInt(request.getParameter("capacity"));
    double price = Double.parseDouble(request.getParameter("price"));
    String hotelName = request.getParameter("hotelName");
    String province = request.getParameter("province");
    String checkInDate = request.getParameter("checkin");
    String checkOutDate = request.getParameter("checkout");
    
 
    String error = "";
    int userId = (int) session.getAttribute("userId");

    // Set the image path based on the room type
    String imagePath = "";
    if (roomType.equals("deluxe")) {
        imagePath = "img/delux.jpg";
    } else if (roomType.equals("standard")) {
        imagePath = "img/standard.jpg";
    } else if (roomType.equals("suite")) {
        imagePath = "img/suite.jpg";
    }
    // Add more room types and image paths as needed

    users user = (users) session.getAttribute("user");
    boolean isLoggedIn = false;
    boolean bookingSuccess = false;
    String fname = null;
    String lname = null;
    String sex = null;
    String dob;
    String email;
    String phone = null;
    String password;
    String address;
    String loginLink = null;
    if (user != null) {
        isLoggedIn = (boolean) session.getAttribute("isLoggedIn");
        fname = user.getFirstName();
        lname = user.getLastName();
        sex = user.getSex();
        dob = user.getDob();
        email = user.getEmail();
        phone = user.getPhoneNumber();
        password = user.getPassword();
        address = user.getAddress();    
    } else {
        loginLink = "login.jsp";
    }

    // Check if the form has been submitted
    if (request.getMethod().equalsIgnoreCase("post")) {
        Dbconnection dbc = new Dbconnection();
        Connection conn = null;
        String sql = "INSERT INTO tblhotelbooking (userId, hotelName, province, checkInDate, checkOutDate, numberOfGuest) VALUES (?,?,?,?,?,?)";
        PreparedStatement stmt = null;
   

        try {
            // Establish database connection
            conn = dbc.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setString(2, hotelName);
            stmt.setString(3, province);
            stmt.setString(4, checkInDate);
            stmt.setString(5, checkOutDate);
            stmt.setInt(6, numberOfGuest);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
             error = ("You have successfully booked!");
              bookingSuccess = true;
            } else {
                // Booking failed
                error = "Failed to book the room. Please try again.";
            }
        } catch (SQLException e) {
            error = "An error occurred while processing your request. Please try again later.";
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<div class="container">
    <h1 class="mt-5">Booking Details</h1>
    <div id="booking-details" class="mt-3">
        <div class="row">
            <!-- Picture Column -->
            <div class="col-md-6">
                <img src="<%= imagePath %>" class="img-fluid" alt="Room Image" style="height: 500px">
            </div>
            <!-- Form Column -->
            <div class="col-md-6">
                <p>You have selected <%= roomType %> room. Please fill in the booking form below:</p>
                <!-- Add booking form here -->
                <form action="#" method="post" id="bookingForm">
                    <div class="form-group">
                        <label for="hotelName">Name of Hotel:</label>
                        <input class="form-control" id="hotelName" name="hotelName" value="<%= hotelName + " " + province %>" readonly>
                        <label for="guests">Number of Guests:</label>
                        <input class="form-control" id="guests" name="guests" value="<%= numberOfGuest %>" readonly>
                        <label for="unitPrice">Unit Price:</label>
                        <input class="form-control" id="unitPrice" name="unitPrice" value="<%= price %> $" readonly>
                    </div>
                    <input type="hidden" name="roomType" value="<%= roomType %>">
                    <div class="form-group">
                        <label for="checkin">Check-in Date:</label>
                        <input type="date" class="form-control" id="checkin" name="checkin" required>
                    </div>
                    <div class="form-group">
                        <label for="checkout">Check-out Date:</label>
                        <input type="date" class="form-control" id="checkout" name="checkout" required>
                    </div>
                    <label for="totalPrice">Total Price:</label>
                    <input class="form-control mb-4" id="totalPrice" name="totalPrice" readonly >
                            

                    <button type="button" class="btn btn-primary" onclick="calculateTotalPrice()">Calculate Total Price</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                
                </form>
              
            </div>
                     <div class="col-md-6">
                              <% if (bookingSuccess) { %>
                              <p class="text-primary">You have Successfully Booked!</p>
                    <a href="hbookingreciept.jsp"><button id="downloadPdfBtn" class="btn btn-primary" style="background-color: red;">Download Invoice</button></a>
                    
                <% } %>
                  </div>
        </div>
    </div>
</div>
                   
                    
<script>
    function calculateTotalPrice() {
        var unitPrice = parseFloat(document.getElementById("unitPrice").value);
        var checkinDate = new Date(document.getElementById("checkin").value);
        var checkoutDate = new Date(document.getElementById("checkout").value);
        var totalPrice = unitPrice * ((checkoutDate - checkinDate) / (1000 * 60 * 60 * 24)); // Calculate total price based on the number of days
        document.getElementById("totalPrice").value = totalPrice.toFixed(2) + " $";
    }

    
    

    // Event listener for form submission
    document.getElementById('bookingForm').addEventListener('submit', function (event) {
        
        calculateTotalPrice(); // Calculate total price
 
     
    });

   
</script>

</body>
</html>
