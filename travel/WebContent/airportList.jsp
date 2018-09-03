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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/rank.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/main.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/airportList.js" type="text/javascript"></script> 
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
}
#btn {
	width:100px;
} 
</style>
</head>
<body>
<jsp:include page="rank.jsp"/>

<div class="w3-bar w3-white w3-border-bottom w3-xlarge " >
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red" onclick="document.getElementById('id01').style.display='block'">Login</button>
  <a href="#" class="w3-bar-item w3-button w3-right w3-hover-red w3-text-grey"><i class="fa fa-search"></i></a>  
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id02').style.display='block'">Subscribe</button>
  <button class="w3-bar-item w3-button w3-text-red w3-hover-red w3-right" onclick="document.getElementById('id03').style.display='block'">Contact</button>
</div>
	<jsp:include page="member/loginform.jsp" />
	<div class="centered">	
		
	
		<h3>실시간 운항 정보</h3>
		
		<div>
			출발공항: <input class="dia_bt3" id="txt1" value="GMP"<%-- value="${from}" --%>/> 
			도착공항: <input class="dia_bt4" id="txt2" value="HND"<%-- value="${to}" --%>/>
			출발날짜: <input id="txt3" value="2018/09/03"<%-- value="${date}" --%> />
			<button id="btn">검색</button>
		</div>
		
		<form action="AirportList.al">
		<table id="realTime" class="display" width="100%"></table>
		
		<input type="hidden" name="param"/>
<!-- 		<input type="hidden" name="departureTime"/>
		<input type="hidden" name="arrivalAirportFsCode"/>
		<input type="hidden" name="arrivalTime"/>
		<input type="hidden" name="carrierFsCode"/> -->
		</form>
	</div>      
</body>
</html>