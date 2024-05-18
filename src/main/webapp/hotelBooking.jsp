<%-- 
    Document   : hotelBooking
    Created on : May 15, 2024, 3:16:05 PM
    Author     : Noy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotels Booking</title>
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
       <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Hotel Booking</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     
    </ul>
  </div>
</nav>

<!-- Header Section -->
<header class="jumbotron jumbotron-fluid text-center">
  <div class="container">
    <h1 class="display-4">Find Your Perfect Stay</h1>
    <p class="lead">Book your hotel room now!</p>
  </div>
</header>

<!-- Search Form -->
<section class="container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <form>
           <div class="form-group">
          <label for="province">Where do you want to stay?</label>
          <select class="form-control" id="province">
            <option value="" disabled selected>Select Province</option>
            <option value="Phnom Penh">Phnom Penh</option>
            <option value="Siem Reap">Siem Reap</option>
            <option value="Sihanoukville">Sihanoukville</option>
            <!-- Add more provinces here -->
          </select>
        </div>
        
        <div class="form-group">
          <label for="guests">How many people:</label>
          <select class="form-control" id="guests">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
          </select>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Search</button>
      </form>
    </div>
  </div>
</section>

<!-- Room Listings -->
<section class="container mt-5">
  <h2 class="text-center mb-4">Available Rooms</h2>
  <div class="row mt-3">
    <div class="col-md-4">
      <div class="card d-flex">
        <img src="img/delux.jpg" class="img-fluid flex-shrink-1" alt="Room Image" style="width: 100%; height: 330px">
        <div class="card-body">
          <h5 class="card-title">Deluxe Room</h5>
      
            <h6>Hotel Name: Tonle Hotel</h4>
                  <p class="card-text">Phnom Penh</p>
          <p class="card-text">Price: $150/night</p>
          <p class="card-text">Capacity: 2 people</p>
           <a href="booking_detail.jsp?room=deluxe&capacity=2&price=150&hotelName=Tonle Hotel&province=Phnom Penh" class="btn btn-primary">Book Now</a>
        </div>
      </div>    
    </div>
    <div class="col-md-4">
      <div class="card d-flex flex-shrink-1" >
        <img class="img-fluid " src="img/standard.jpg" alt="Room Image" style="width: 100%; height: 330px">
        <div class="card-body">
          <h5 class="card-title">Standard Room</h5>
          <h6>Hotel Name: Angkor Hotel</h4>
            <p class="card-text">Siemreap</p>
          <p class="card-text">Price: $100/night</p>
          <p class="card-text">Capacity: 3 people</p>
          <a href="booking_detail.jsp?room=standard&capacity=3&price=100&hotelName=Angkor&province=Siemreap" class="btn btn-primary">Book Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card d-flex">
        <img src="img/suits.jpg" class="img-fluid flex-shrink-1" alt="Room Image" style="width: 100%; height: 330px">
        <div class="card-body">
          <h5 class="card-title">Suite Room</h5>
            <h6>Hotel Name: CHESDA Hotel</h4>
              <p class="card-text">Kampot</p>
          <p class="card-text">Price: $200/night</p>
          <p class="card-text">Capacity: 4 people</p>
          <a href="#" class="btn btn-primary">Book Now</a>
        </div>
      </div>
    </div>
  </div>
  <div class="row mt-3">
    <div class="col-md-4">
      <div class="card d-flex">
        <img src="img/delux.jpg" class="img-fluid flex-shrink-1" alt="Room Image" style="width: 100%; height: 330px">
        <div class="card-body">
          <h5 class="card-title">Deluxe Room</h5>
            <h6>Hotel Name: Phillip Hotel</h4>
              <p class="card-text">Kampot</p>
          <p class="card-text">Price: $150/night</p>
          <p class="card-text">Capacity: 3 people</p>
          <a href="#" class="btn btn-primary">Book Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card d-flex flex-shrink-1" >
        <img class="img-fluid " src="img/standard.jpg" alt="Room Image" style="width: 100%; height: 330px">
        <div class="card-body">
          <h5 class="card-title">Standard Room</h5>
            <h6>Hotel Name: CHESDA Hotel</h4>
          <p class="card-text">Price: $100/night</p>
          <p class="card-text">Capacity: 4 people</p>
          <a href="#" class="btn btn-primary">Book Now</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card d-flex">
        <img src="img/suits.jpg" class="img-fluid flex-shrink-1" alt="Room Image" style="width: 100%; height: 330px">
        <div class="card-body">
          <h5 class="card-title">Suite Room</h5>
            <h6>Hotel Name: Life Good Hotel</h4>
          <p class="card-text">Price: $200/night</p>
          <p class="card-text">Capacity: 4 people</p>
          <a href="#" class="btn btn-primary">Book Now</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Bootstrap JS and jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>

