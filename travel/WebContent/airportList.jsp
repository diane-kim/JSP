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

<%-- <script src="<%=request.getContextPath()%>/js/airportList.js" type="text/javascript"></script>  --%>

<!-- <script type="application/javascript" src="http://server2.example.com/Users/1234?jsonp=parseResponse">
</script> -->

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
	<script type="text/javascript">
	$(document).ready(function() {	
		$("#btn").click(function() {
			getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
		});

		
		$("#txt3").keyup(function(e) {
			if (e.keyCode == 13)
				getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
		});
	});
	
	function getAirLine(from , to , date) {
		
		console.log(from + to + date);
		$.ajax({
				url : "https://api.flightstats.com/flex/schedules/rest/v1/json/from/"+from+"/to/"+to+"/departing/"+date+"?appId=6d442315&appKey=301aa216b58dee04e31de0f4d5733590&extendedOptions=languageCode:ko",
				dataType: 'json', 
				success : function(datas) {
					console.log(datas);
					var dataSet = [];
					
					for (var i = 0; i < datas.scheduledFlights.length; i++) {
						for(var j = 0 ; j < datas.appendix.airlines.length ; j++){
				        	if(datas.scheduledFlights[i].carrierFsCode == datas.appendix.airlines[j].fs){
				        		airlines = datas.appendix.airlines[j].name;
							}
				        } 
						var dataArr = [];
						dataArr.push(datas.scheduledFlights[i].departureAirportFsCode);
						dataArr.push(datas.scheduledFlights[i].departureTime.substring(11,16))
						dataArr.push(datas.scheduledFlights[i].arrivalAirportFsCode)
						dataArr.push(datas.scheduledFlights[i].arrivalTime.substring(11,16))
						dataArr.push(datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber)
	 					dataArr.push(airlines);		 /*
						dataArr.push("<img src='../img/스페인2.jpg'/>"); */
						dataArr.push("<img src='../img/스페인2.jpg'/>");						
						dataSet.push(dataArr);
						
					}
					console.log(dataSet);
					$('#realTime').DataTable({
						destroy: true,
				        data: dataSet,
				        columns: [
				            { title: "From" },
				            { title: "Depart.Time" },
				            { title: "To" },
				            { title: "Arrial.Time" },
				            { title: "AirLine" },
				            { title: "AirCode" },
				            { title: "price" }, 
						]
					});					
				}
			});
}
	</script>
	
	
		<h3>실시간 운항 정보</h3>
		
		<div>
			출발공항: <input class="dia_bt3" id="txt1" value="${from}"/> 
			도착공항: <input class="dia_bt4" id="txt2" value="${to}"/>
			출발날짜: <input id="txt3" value="${fromdate}" />
			<button id="btn">검색</button>
		</div>
		
		<table id="realTime" class="display" width="100%"></table>
		
	</div>
	
      
</body>
</html>