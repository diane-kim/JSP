<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>여행</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!--  jquery 라이브러리 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/rank.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/main.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/airportList.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/airportWeather.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rank.css">
<css src="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>


<% String id = (String)session.getAttribute("id");%>

<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
#btn {
	width:100px;
} 
#btn2 {
	width:100px;
} 

tr {
	border-bottom: 1px solid lightgrey;	
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
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
<jsp:include page="rank.jsp"/>

<div class="w3-bar w3-white w3-border-bottom w3-xlarge front" >
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red" onclick="document.getElementById('id01').style.display='block'">Login</button>
  <a href="#" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"><i class="fa fa-search"></i></a>  
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id02').style.display='block'">Subscribe</button>
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id03').style.display='block'">Contact</button>
</div>
	<jsp:include page="member/loginform.jsp" />
	<div class="sidebar">
	  <a class="active" href="#home">실시간 운항 정보</a>
	  <a href="#news">공항 날씨</a>
	</div>
	<div class="centered main">
	<br><br><br><br>	
		<div>
			출발공항: <input class="dia_bt3" id="txt1" value="${from}" size="10"/> 
			도착공항: <input class="dia_bt4" id="txt2" value="${to}" size="10"/>
			출발날짜: <input id="txt3" value="${fromdate}" size="10"/>			
			<button id="btn" onclick="reserv('${f}','${t}','${fromdate}','${todate}','${num}','${seat}')">검색</button>
			<button id="btn2">변경</button>
		</div>
		
		<input class="dia_bt3" id="txt4" value="${from}" size="10"/> 
		<button id="btn3">검색</button>

		<div class="w3-half w3-container">
			<p id="name"></p>
			<p id="city"></p>
			<p id="coverage"></p>
		</div>
		
		<div class="w3-half w3-container">
			<div id="map" style="width: 100%; height: 400px;"></div>
		</div>
		
		<script>
		$("#btn2").click(function swap_content(){
			var tmp = document.getElementById('txt1').value;
			document.getElementById('txt1').value = document.getElementById('txt2').value;
			document.getElementById('txt2').value = tmp;
		});

		$("#btn").click(function check() {
			if (!$("#txt1").val()) {
				alert("출발공항을 입력해 주세요.");
				return false; 
			}else if(!$("#txt2").val()){
				alert("도착공항을 입력해 주세요.");
				return false; 
			}else if(!$("#txt3").val()){
				alert("날짜를 입력해 주세요.");
				return false; 
			}
		}); 
		</script>
		
		<table id="realTime" class="display" width="100%"></table>		
	</div>      
</body>
</html>