<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
	<div class="sidebar">
	  <a class="fa fa-align-justify" href="airportList.jsp"> 실시간 운항 정보</a>
	  <a class="fa fa-cloud" href="airportWeather.jsp"> 공항 날씨</a>
	  <a class="fa fa-search" href="airportNear.jsp" id="nearAirport"> 가까운 공항 찾기</a>
	  <a class="fa fa-star-half-empty" href="airportRank.jsp"> 항공기 등급</a>
</div>