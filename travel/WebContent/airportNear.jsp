<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>근처 항공사 찾기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!--  jquery 라이브러리 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs"></script>
<script src="<%=request.getContextPath()%>/js/airportNear.js" type="text/javascript"></script>
<% String id = (String)session.getAttribute("id");%>
</head>
<body>
<jsp:include page="rank.jsp"/>
<jsp:include page="Rheader.jsp"/>
<jsp:include page="member/loginform.jsp" />
<jsp:include page="sidebar.jsp" />

	<br><br><br><br>	
		<p class="prompt">현재 위치에서 가장 가까운 공항을 탐색합니다. 반경은 30 마일 입니다.  모든 시간은 현지 시각 기준입니다 (지정된 위치의 지정된 반경 내에있는 공항의 목록을 반환합니다.)</p>
		<p class="prompt">Returns a listing of airports located within a specified radius of the given position.</p>
		<br>
		<div class="w3-half w3-container">
			<div class="w3-topbar w3-border-amber">
			<img id ="airport" src="">
			<p id="name"></p>
			</div>
		</div>

		<div class="w3-half w3-container">
		<div class="w3-topbar w3-border-amber">
			<div id="map1" style="width: 80%; height: 400px;"></div>
		</div>
		</div>

</body>
</html>