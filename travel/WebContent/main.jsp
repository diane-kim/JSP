<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String contentPage=request.getParameter("contentPage");
if(contentPage==null)
    contentPage="airportList.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<title> Main페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/airport.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 


<meta charset="utf-8">
</head>
<body>
	<jsp:include page="rank.jsp"/>
	<div style="height:5%;">
	<jsp:include page="header.jsp" />
	</div>
	<div class="sidebar" style="width:15%; height:300%; float:left;">
	<jsp:include page="sidebar.jsp" />
	</div>
	<!--  메인화면 부분 -->
	<div style="width:75%; height:100%; float:left;">
	<jsp:include page="<%=contentPage%>" />
	</div>



</body>
</html>