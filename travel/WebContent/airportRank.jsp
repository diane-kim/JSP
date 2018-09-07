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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/airport.css" type="text/css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<!--  달력 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /><!--  jQuery UI CSS파일-->  
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  <!--  jQuery 기본 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script><!-- jQuery UI 라이브러리 js파일  -->
<!--  달력 -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/AirPortListDropDown.js" ></script>
<script src="<%=request.getContextPath()%>/js/airportRank.js" type="text/javascript"></script>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
   integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
   crossorigin="anonymous">

<% String id = (String)session.getAttribute("id");%>
<style type="text/css">

</style>
</head>
<body>
<jsp:include page="rank.jsp"/>
<jsp:include page="Rheader.jsp"/>
<jsp:include page="member/loginform.jsp" />
<jsp:include page="sidebar.jsp"/>

	<div class="centered main">
	<br><br><br><br>	
<!--  항공편 드롭다운 -->	
		<div class="input-container">	
   		<div class="dropdown">
   		&nbsp;출발공항: <input class="dia_bt area" id="txt5" value="${from}" placeholder="출발지" name="from" size="10" readonly="readonly"/>
    		<div class="dropdown-content area">
    			<table class="area">
    				<tr><td><h4 class="area" ><b class="area">국내</b></h4></td></tr>
    				<tr><td><a class ="contury" href="#;">인천</a></td><td><a class ="contury area" href="#;">서울</a></td><td class="area"><a class ="contury area" href="#;">부산</a></td><td class="area"><a class ="contury area" href="#;">제주</a></td></tr>
    				<tr><td><h4 class="area"><b class="area">중화권</b></h4></td></tr>
    				<tr><td><a class ="contury" href="#;">홍콩</a></td><td class="area"><a class ="contury" href="#;">타이페이</a></td><td class="area"><a class ="contury" href="#;">마카오</a></td><td class="area"><a class ="contury" href="#;">상하이</a></td><td class="area"><a class ="contury" href="#;">베이징</a></td><td class="area"><a class ="contury" href="#;">칭다오</a></td></tr>
    				<tr><td><h4 class="area"><b class="area">아시아</b></h4></td></tr>
    				<tr><td><a class ="contury" href="#;">도쿄</a></td><td class="area"><a class ="contury" href="#;">싱가포르</a></td><td class="area"><a class ="contury" href="#;">방콕</a></td><td class="area"><a class ="contury" href="#;">마닐라</a></td><td class="area"><a class ="contury" href="#;">쿠알라룸푸르</a></td><td class="area"><a class ="contury" href="#;">하노이</a></td></tr>
    				<tr><td><h4 class="area"><b class="area">미주/유럽</b></h4></td></tr>      
	    			<tr><td><a class ="contury" href="#;">런던</a></td><td class="area"><a class ="contury" href="#;">파리</a></td><td class="area"><a class ="contury" href="#;">로마</a></td><td class="area"><a class ="contury" href="#;">로스앤젤레스</a></td><td class="area"><a class ="contury" href="#;">뉴욕</a></td><td class="area"><a class ="contury" href="#;">샌프란시스코</a></td></tr>
    			</table>
      		</div>
    	</div>   
    	<div class="dropdown">
   		&nbsp;도착공항: <input class="dia_bt2 area2" id="txt6" value="${to}" placeholder="도착지" name="to" size="10" readonly="readonly"/>   
    		<div class="dropdown2-content area2">
      			<table class="area2">
      				<tr><td class="area2"><h4 class="area2"><b class="area2">국내</b></h4></td></tr>
      				<tr><td><a class ="tocontury" href="#;">인천</a></td><td><a class ="tocontury" href="#;">서울</a></td><td><a class ="tocontury" href="#;">부산</a></td><td><a class ="tocontury" href="#;">제주</a></td></tr>
      				<tr><td class="area2"><h4><b>중화권</b></h4></td></tr>
      				<tr><td><a class ="tocontury" href="#;">홍콩</a></td><td><a class ="tocontury" href="#;">타이페이</a></td><td><a class ="tocontury" href="#;">마카오</a></td><td><a class ="tocontury" href="#;">상하이</a></td><td><a class ="tocontury" href="#;">베이징</a></td><td><a class ="tocontury" href="#;">칭다오</a></td></tr>
     				<tr><td class="area2"><h4><b>아시아</b></h4></td></tr>
      				<tr><td><a class ="tocontury" href="#;">도쿄</a></td><td><a class ="tocontury" href="#;">싱가포르</a></td><td><a class ="tocontury" href="#;">방콕</a></td><td><a class ="tocontury" href="#;">마닐라</a></td><td><a class ="tocontury" href="#;">쿠알라룸푸르</a></td><td><a class ="tocontury" href="#;">하노이</a></td></tr>
      				<tr><td class="area2"><h4><b>미주/유럽</b></h4></td></tr>      
      				<tr><td><a class ="tocontury" href="#;">런던</a></td><td><a class ="tocontury" href="#;">파리</a></td><td><a class ="tocontury" href="#;">로마</a></td><td><a class ="tocontury" href="#;">로스앤젤레스</a></td><td><a class ="tocontury" href="#;">뉴욕</a></td><td><a class ="tocontury" href="#;">샌프란시스코</a></td></tr>
      			</table>
      		</div>
    	</div>  

      		<button id="btn5" class="btn2 default">검색</button>
      		<button id="btn6" class="btn2 default" >변경</button>
	   	 </div>	
		<p class="prompt"></p>		
		<p class="prompt">주어진 출발 및 도착 공항을 가진 모든 항공편의 계산 된 등급 정보를 반환합니다.</p>
		<p class="prompt">Returns the calculated ratings information for all flights having the given departure and arrival airports</p>
		
			
	</div>      
	<div class="centered main">
	<table id="airportRank" class="display" width="100%"></table>	
	</div>
</body>
</html>