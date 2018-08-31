<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs&sensor=false"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/GoogleMapMark.js"></script>
<!--  searchview js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/SearchViewCheck.js"></script>

<head><title>여행검색</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/searchView.css" />
<!--  검색폼                -->
<!--  날짜 폼 -->
<!--  jQuery UI CSS파일--> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!--  jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일  -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!--  날짜폼 -->

<!--  아이콘가져오기 -->  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--  아이콘가져오기-->
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

a.no-uline { text-decoration:none }

.input-container {
    display: -ms-flexbox; /* IE10 */
    display: flex;
    width: 100%;
    margin-bottom: 15px;
}

.icon {
    padding: 10px;
    background: dodgerblue;
    color: white;
    min-width: 50px;
    text-align: center;
}


.cal {
    padding: 10px;
    min-width: 50px;
    text-align: center;
    font-size: 40px;
}

.input-field {
    width: 100%;
    padding: 10px;
    outline: none;
}

.input-field:focus {
    border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
    background-color: dodgerblue;
    color: white;
    padding: 15px 20px;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

.btn:hover {
    opacity: 1;
}

.num {
	 width: 10%;
	 text-align: center;
	 font-size: 40px;
	 opacity: 5;
}
.seat {
	 width: 10%;
	 text-align: center;
	 font-size: 40px;
	 opacity: 5;
}
</style>

<!--  검색폼                -->
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
<form action="<%=request.getContextPath()%>/AirportList.al" style="max-width:1000px;margin:auto">
  
  <div class="input-container">
  
    <i class="fa fa-user icon"></i>	
    <input id="dia_bt" class="input-field" type="text" placeholder="출발지" name="출발지">
    <i class="fa fa-user icon"></i>
    <input id="dia_bt2" class="input-field" type="text" placeholder="도착지" name="도착지">
    <!--  다이얼로그부분 -->
      <div id="dia_rs" style="display:none;">
      <table border=1>
      <tr><td>국내</td></tr>
      <tr><td><a class ="contury" href="#;">서울</a></td><td><a class ="contury" href="#;">부산</a></td><td><a class ="contury" href="#;">제주</a></td></tr>
      <tr><td>중화권</td></tr>
      <tr><td><a class ="contury" href="#;">홍콩</a></td><td><a class ="contury" href="#;">타이페이</a></td><td><a class ="contury" href="#;">마카오</a></td><td><a class ="contury" href="#;">상하이</a></td><td><a class ="contury" href="#;">베이징</a></td><td><a class ="contury" href="#;">칭다오</a></td></tr>
      <tr><td>아시아</td></tr>
      <tr><td><a class ="contury" href="#;">도쿄</a></td><td><a class ="contury" href="#;">싱가포르</a></td><td><a class ="contury" href="#;">방콕</a></td><td><a class ="contury" href="#;">마닐라</a></td><td><a class ="contury" href="#;">쿠알라룸푸르</a></td><td><a class ="contury" href="#;">하노이</a></td></tr>
      <tr><td>미주/유럽</td></tr>      
      <tr><td><a class ="contury" href="#;">런던</a></td><td><a class ="contury" href="#;">파리</a></td><td><a class ="contury" href="#;">로마</a></td><td><a class ="contury" href="#;">로스앤젤레스</a></td><td><a class ="contury" href="#;">뉴욕</a></td><td><a class ="contury" href="#;">샌프란시스코</a></td></tr>
      </table>
      </div>
      
         <!--  다이얼로그부분2 -->
      <div id="dia_rs2" style="display:none;">
      <table border=1>
      <tr><td>국내</td></tr>
      <tr><td><a class ="tocontury" href="#;">서울</a></td><td><a class ="tocontury" href="#;">부산</a></td><td><a class ="tocontury" href="#;">제주</a></td></tr>
      <tr><td>중화권</td></tr>
      <tr><td><a class ="tocontury" href="#;">홍콩</a></td><td><a class ="tocontury" href="#;">타이페이</a></td><td><a class ="tocontury" href="#;">마카오</a></td><td><a class ="tocontury" href="#;">상하이</a></td><td><a class ="tocontury" href="#;">베이징</a></td><td><a class ="tocontury" href="#;">칭다오</a></td></tr>
      <tr><td>아시아</td></tr>
      <tr><td><a class ="tocontury" href="#;">도쿄</a></td><td><a class ="tocontury" href="#;">싱가포르</a></td><td><a class ="tocontury" href="#;">방콕</a></td><td><a class ="tocontury" href="#;">마닐라</a></td><td><a class ="tocontury" href="#;">쿠알라룸푸르</a></td><td><a class ="tocontury" href="#;">하노이</a></td></tr>
      <tr><td>미주/유럽</td></tr>      
      <tr><td><a class ="tocontury" href="#;">런던</a></td><td><a class ="tocontury" href="#;">파리</a></td><td><a class ="tocontury" href="#;">로마</a></td><td><a class ="tocontury" href="#;">로스앤젤레스</a></td><td><a class ="tocontury" href="#;">뉴욕</a></td><td><a class ="tocontury" href="#;">샌프란시스코</a></td></tr>
      </table>
      </div>    
  </div>

  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <input class="input-field testDatepicker" type="text" placeholder="출발날짜" name="fromdate" >
    <i class="fa fa-envelope icon"></i>
    <input class="input-field testDatepicker" type="text" placeholder="도착날짜" name="todate" >
  </div>
  
  <div class="input-container">
  	
    <h2>성인 </h2>
    <a href="javascript:;" class="bt_up fa fa-plus cal no-uline" > </a>
    <input class="num" type="text" placeholder="성인" value="0" readonly="readonly" name="num">
    <a href="javascript:;" class="bt_down fa fa-minus cal no-uline" > </a>
    
    <h2> 좌석 </h2>
    <select name="seat">
    <option value="일반">일반</option>
    <option value="비즈니스">비즈니스</option>
    </select>
  </div>
  <input type="hidden" name="from"/>
  <input type="hidden" name="to"/>

  <button type="submit" class="btn" id="getBtn">조회</button>
</form>

</body>

</html>