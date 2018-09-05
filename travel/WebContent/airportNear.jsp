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
<script src="<%=request.getContextPath()%>/js/airportNear.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho" rel="stylesheet">


<% String id = (String)session.getAttribute("id");%>

<style>
.centered {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
#btn3 {
	width:100px;
} 

tr {
	border-bottom: 1px solid lightgrey;	
}

/* Style the search field */
form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

/* Style the submit button */
form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}
</style>

</head>
<body>
<jsp:include page="rank.jsp"/>
<jsp:include page="Rheader.jsp"/>
<jsp:include page="member/loginform.jsp" />
<jsp:include page="sidebar.jsp" />

	<div class="centered main" >
	<br><br><br><br>	

		<div>
			<button type="hidden" class="btn default" id="btn4" style="display:none;">검색</button>
		</div>

		<br>
		<div class="w3-half w3-container">
		</div>

		<div class="w3-half w3-container">
			<div id="map1" style="width: 80%; height: 400px;"></div>
		</div>

	</div>
</body>
</html>