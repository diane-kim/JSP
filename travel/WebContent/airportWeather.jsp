<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>날씨</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!--  jquery 라이브러리 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs"></script>
<script src="<%=request.getContextPath()%>/js/airportWeather.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<% String id = (String)session.getAttribute("id");%>
</head>
<body>
<jsp:include page="rank.jsp"/>
<jsp:include page="Rheader.jsp"/>
<jsp:include page="member/loginform.jsp" />
<jsp:include page="sidebar.jsp" />
	<div class="centered main">
	<br><br><br><br>	
	<div class="input-container">
		<div class="dropdown">
   		&nbsp;출발공항: <input class="input-field dia_bt area input bbb" id="txt4" value="${from}" placeholder="날씨" name="from" size="10" readonly="readonly"/>
    		<div class="dropdown-content area">
    			<table class="area">
    				<tr class="trr"><td><h4 class="area" ><b class="area">국내</b></h4></td></tr>
    				<tr class="trr"><td><a class ="contury" href="#;">인천</a></td><td><a class ="contury" href="#;">서울</a></td><td class="area"><a class ="contury" href="#;">부산</a></td><td class="area"><a class ="contury" href="#;">제주</a></td></tr>
    				<tr class="trr"><td><h4 class="area"><b class="area">중화권</b></h4></td></tr>
    				<tr class="trr"><td><a class ="contury" href="#;">홍콩</a></td><td class="area"><a class ="contury" href="#;">타이페이</a></td><td class="area"><a class ="contury" href="#;">마카오</a></td><td class="area"><a class ="contury" href="#;">상하이</a></td><td class="area"><a class ="contury" href="#;">베이징</a></td><td class="area"><a class ="contury" href="#;">칭다오</a></td></tr>
    				<tr class="trr"><td><h4 class="area"><b class="area">아시아</b></h4></td></tr>
    				<tr class="trr"><td><a class ="contury" href="#;">도쿄</a></td><td class="area"><a class ="contury" href="#;">싱가포르</a></td><td class="area"><a class ="contury" href="#;">방콕</a></td><td class="area"><a class ="contury" href="#;">마닐라</a></td><td class="area"><a class ="contury" href="#;">쿠알라룸푸르</a></td><td class="area"><a class ="contury" href="#;">하노이</a></td></tr>
    				<tr class="trr"><td><h4 class="area"><b class="area">미주/유럽</b></h4></td></tr>      
	    			<tr class="trr"><td><a class ="contury" href="#;">런던</a></td><td class="area"><a class ="contury" href="#;">파리</a></td><td class="area"><a class ="contury" href="#;">로마</a></td><td class="area"><a class ="contury" href="#;">로스앤젤레스</a></td><td class="area"><a class ="contury" href="#;">뉴욕</a></td><td class="area"><a class ="contury" href="#;">샌프란시스코</a></td></tr>
    			</table>
      		</div>
    	</div>    	  
		<div>
			<%-- <input class="dia_bt3" id="txt4" value="${from}" size="10"/>  --%>
			<button class="btn2 default input-field" id="btn3">검색</button>
		</div>
	</div>
	
	<p class="prompt">특정 공항 주변의 비행장에 대한 가장 최근의 METAR 일기 예보를 검색하십시오. METAR 보고서는 현재 상태를 기술하고 약 1 시간마다 업데이트됩니다.</p>
	<p class="prompt">Retrieve the most current available METAR weather report for the aerodrome around a given airport. METAR reports describe current conditions and are updated about once an hour.</p>
	
		<div class="w3-half w3-container">
			<p id="name"></p>
			<p id="city"></p>
			<p id="temperatureCelsius"></p>
			<p id="value"></p>
			<p id="speedKnots"></p>
			<img id ="weather" src="">
		</div>
		<br>
		
		<div class="w3-half w3-container">
			<div id="map" style="width: 80%; height: 400px;"></div>
		</div>
	</div>
</body>
</html>