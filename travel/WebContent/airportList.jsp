<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>여행</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/rank.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/main.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rank.css" />
<% String id = (String)session.getAttribute("id");%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btn").click(function() {
			alert("aaaa");
			getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
		});

		
		$("#txt3").keyup(function(e) {
			if (e.keyCode == 13)
				getAirLine($("#txt1").val(),$("#txt2").val(),$("#txt3").val());
		});
	});
	function getAirLine(from , to , date) {
		alert(from + to + date);
		$.ajax({
				url : "https://api.flightstats.com/flex/schedules/rest/v1/json/from/"+from+"/to/"+to+"/departing/"+date+"?appId=6d442315&appKey=301aa216b58dee04e31de0f4d5733590",
				success : function(datas) {
					console.log(datas);
					var airlines;
					var innerHtml = "<table border='1' style='width:1000px;'><th>No</th><th>출발지</th><th>출발시간</th>"
							+ "<th>도착지</th><th>도착시간</th><th>항공기종</th><th>항공사</th>";					
					
					for (var i = 0; i < datas.scheduledFlights.length; i++) {
						console.log(datas.appendix.airlines.length);
						for(var j = 0 ; j < datas.appendix.airlines.length ; j++){
							console.log(datas.scheduledFlights[i].carrierFsCode);
							console.log(datas.appendix.airlines[j].fs);
				        	if(datas.scheduledFlights[i].carrierFsCode == datas.appendix.airlines[j].fs){
				        		airlines = datas.appendix.airlines[j].name;
							}
				        } 
						innerHtml += "<tr><td>" + i
								+ "</td><td>" + datas.scheduledFlights[i].departureAirportFsCode
								+ "</td><td>" + datas.scheduledFlights[i].departureTime.substring(11,16)
						        + "</td><td>" + datas.scheduledFlights[i].arrivalAirportFsCode
						        + "</td><td>" + datas.scheduledFlights[i].arrivalTime.substring(11,16)
						        + "</td><td>" + datas.scheduledFlights[i].carrierFsCode + datas.scheduledFlights[i].flightNumber
	 					        + "</td><td>" + airlines
								+ "</td></tr>";
					}
					innerHtml += "</table>";
					$("#txtHint").html(innerHtml);
			   }
			});
	}
</script>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
#btn {
	width:100px;
} 
tr.b {
	border-bottom: 1px solid lightgrey;
	color: grey; 
	height: 50px
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
			출발공항: <input id="txt1" value="GMP"/> 
			<input id="txt2" value="HND"/>
			<input id="txt3" value="2018/09/30" />
			<button id="btn">검색</button>
		</div>
		
		<div id="txtHint"></div>
	</div>
</body>
</html>