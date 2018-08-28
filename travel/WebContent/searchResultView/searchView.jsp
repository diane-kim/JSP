<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs&sensor=false"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/GoogleMapMark.js"></script>

<head><title>여행검색</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/searchView.css" />
</head>
<body>
<script>createMap('${dto.fromName}','${dto.toName}',${dto.fromLatitude},${dto.toLatitude},${dto.fromLongitude},${dto.toLongitude}) </script>

<div class="w3-display-container" style="margin-bottom:50px">
  <img src="<%=request.getContextPath()%>/w3images/beach3.jpg" style="width:100%">
  <div class="w3-display-bottomleft w3-container w3-amber w3-hover-orange w3-hide-small" style="bottom:10%;opacity:0.7;width:70%">
  <h2><b>${dto.title}<br>${dto.content}</b></h2>
</div>
</div>

<div class="w3-row w3-container" style="margin:50px 0">
<div class="w3-half w3-container">
  <div class="w3-topbar w3-border-amber">
  <div id="map" style="width:100%;height:400px;"></div>
  </div>
</div>


<div class="w3-half w3-container">
  <div class="w3-topbar w3-border-amber">
    	<div class="slideshow-container">
		<c:forEach var="l" items="${list}">
			<div class="mySlides fade">
				<div class="numbertext">${l.count}/ ${list.size()}</div>
				<img src="<%=request.getContextPath()%>/img/${l.fileName}" style="width: 100%;height:400px;">
			</div>
		</c:forEach>

		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>

	</div>
	<br>

	<div style="text-align: center">
		<c:forEach var="l" items="${list}">
			<span class="dot" onclick="currentSlide(${l.count})"></span>
		</c:forEach>
	</div>
  </div>
</div>
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

</body></html>