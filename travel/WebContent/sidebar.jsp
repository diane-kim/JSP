<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/airportNear.js" type="text/javascript"></script>

<style>
.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  position: fixed;
  height: 100%;
  overflow: auto;
  top:80px;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #ED4C00;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}

.front {position:absolute;z-index:100;}
.back {position:absolute;z-index:1;}

</style>
</head>
<body>
	<div class="sidebar">
	  <a class="fa fa-align-justify" href="airportList.jsp"> 실시간 운항 정보</a>
	  <a class="fa fa-cloud" href="airportWeather.jsp"> 공항 날씨</a>
	  <a class="fa fa-search" href="airportNear.jsp" id="nearAirport"> 가까운 공항 찾기</a>
	  <a class="fa fa-star-half-empty" href="airportWeather.jsp"> 항공기 등급</a>
	</div>
	<div class="centered main">
</body>
</html>