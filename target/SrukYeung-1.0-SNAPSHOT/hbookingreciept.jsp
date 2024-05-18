<%@ page import="java.sql.*" %>
<%@ page import="Beans.Dbconnection" %>
<%@ page import="Beans.users" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Invoice</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="text-center">
<%
    int bookingId = 0; // Initialize bookingId as int
    String fname = "";
    String lname = "";
    String sex = "";
    String HotelName = "";
    String phone = "";
    String checkInDate = "";
    String checkOutDate = "";
    String dateOfIssue = "";
    String error = ""; 

    int userId = (int) session.getAttribute("userId");

    Dbconnection dbc = new Dbconnection();
    Connection conn = null;
    String sql = "SELECT * FROM tblusers INNER JOIN tblhotelbooking ON tblusers.userId = tblhotelbooking.userId WHERE tblusers.userId = ?";
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        conn = dbc.getConnection();
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, userId);

        rs = stmt.executeQuery();
        while(rs.next()) {
            bookingId = rs.getInt("hBookingId");
            dateOfIssue = rs.getString("timeOfBooked");
            fname = rs.getString("firstName");
            lname = rs.getString("lastName");
            sex = rs.getString("sex");
            HotelName = rs.getString("hotelName");
            phone = rs.getString("phoneNumber");
            checkInDate = rs.getString("checkInDate");
            checkOutDate = rs.getString("checkOutDate");
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
%>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card text-left">
                <div class="card-header">
                    <h1>Booking Invoice</h1>
                </div>
                <div class="card-body">
                    <p><strong>Booking ID:</strong> <%= bookingId %></p>
                    <p><strong>Booking Date:</strong> <%= dateOfIssue %></p>
                    <p><strong>First Name:</strong> <%= fname %></p>
                    <p><strong>Last Name:</strong> <%= lname %></p>
                    <p><strong>Sex:</strong> <%= sex %></p>
                    <p><strong>Hotel Name:</strong> <%= HotelName %></p>
                    <p><strong>Phone:</strong> <%= phone %></p>
                    <p><strong>Check-in Date:</strong> <%= checkInDate %></p>
                    <p><strong>Check-out Date:</strong> <%= checkOutDate %></p>
                </div>
             
                <div class="card-footer">
    <button class="btn btn-primary" id="printBtn"><i class="fas fa-print"></i> Print</button>
    
</div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- jsPDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>

<script>
    // Function to print the content
    function printContent() {
        window.print();
    }

    // Event listener for the print button
    document.getElementById('printBtn').addEventListener('click', printContent);
</script>
<script>
    // Function to generate PDF
    function generatePDF() {
        const doc = new jsPDF();
        // Add content to the PDF
        doc.text('Booking ID: <%= bookingId %>', 10, 10);
        doc.text('Booking Date: <%= dateOfIssue %>', 10, 20);
        doc.text('First Name: <%= fname %>', 10, 30);
        doc.text('Last Name: <%= lname %>', 10, 40);
        doc.text('Sex: <%= sex %>', 10, 50);
        doc.text('Hotel Name: <%= HotelName %>', 10, 60);
        doc.text('Phone: <%= phone %>', 10, 70);
        doc.text('Check-in Date: <%= checkInDate %>', 10, 80);
        doc.text('Check-out Date: <%= checkOutDate %>', 10, 90);

        // Save the PDF
        doc.save('booking_invoice.pdf');
    }

    // Function to print the content
    function printContent() {
        window.print();
    }

 

    // Event listener for the download button
    document.getElementById('downloadPdfBtn').addEventListener('click', generatePDF);
</script>
</body>
</html>
