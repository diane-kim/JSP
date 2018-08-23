<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html><head><title>헤더</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}
</style>
</head>
<body class="w3-light-grey" contenteditable="false">
<!-- Header -->
<header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px">
  <img class="w3-image" src="<%=request.getContextPath()%>/w3images/london.jpg" alt="London" width="1500" height="700">
  <div class="w3-display-middle" style="width:65%">
    <div class="w3-bar w3-black">
      <button class="w3-bar-item w3-button tablink w3-red" onclick="openLink(event, 'Flight');"><i class="fa fa-plane w3-margin-right"></i>Flight</button>
      <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Hotel');"><i class="fa fa-bed w3-margin-right"></i>Hotel</button>
      <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Car');"><i class="fa fa-car w3-margin-right"></i>Rental</button>
    </div>

    <!-- Tabs -->
    <div id="Flight" class="w3-container w3-white w3-padding-16 myLink" style="display: block;">
      <h3>Travel the world with us</h3>
      <div class="w3-row-padding" style="margin:0 -16px;">
        <div class="w3-half">
          <label>From</label>
          <input class="w3-input w3-border" type="text" placeholder="Departing from">
        </div>
        <div class="w3-half">
          <label>To</label>
          <input class="w3-input w3-border" type="text" placeholder="Arriving at">
        </div>
      </div>
      <p><button class="w3-button w3-dark-grey">Search and find dates</button></p>
    </div>

    <div id="Hotel" class="w3-container w3-white w3-padding-16 myLink" style="display: none;">
      <h3>Find the best hotels</h3>
      <p>Book a hotel with us and get the best fares and promotions.</p>
      <p>We know hotels - we know comfort.</p>
      <p><button class="w3-button w3-dark-grey">Search Hotels</button></p>
    </div>

    <div id="Car" class="w3-container w3-white w3-padding-16 myLink" style="display: none;">
      <h3>Best car rental in the world!</h3>
      <p><span class="w3-tag w3-deep-orange">DISCOUNT!</span> Special offer if you book today: 25% off anywhere in the world with CarServiceRentalRUs</p>
      <input class="w3-input w3-border" type="text" placeholder="Pick-up point">
      <p><button class="w3-button w3-dark-grey">Search Availability</button></p>
    </div>
  </div>
</header>
</body>
</html>