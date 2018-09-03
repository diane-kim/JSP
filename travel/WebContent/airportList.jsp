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
#btn2 {
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
			출발공항: <input class="dia_bt3" id="txt1" value="${from}" size="10"/> 
			도착공항: <input class="dia_bt4" id="txt2" value="${to}" size="10"/>
			출발날짜: <input id="txt3" value="${fromdate}" size="10"/>
			<button id="btn" style="width:10%px; height:15%px;">검색</button>
			<button id="btn2" style="width:10%px; height:15%px;" >변경</button>
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