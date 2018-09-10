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

<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic'); /* 나눔폰트 */
@import url('https://fonts.googleapis.com/css?family=Jua'); /* Jua폰트 */

.nanumfont { /* 나눔폰트  */
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 20px;
}

.juafont { /* jua폰트 */
	font-family: 'Jua', sans-serif;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	margin: 0px 0px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button3 {
	background-color: white;
	color: red;
	border: 2px solid #f44336;
}

.button3-green {
	background-color: white;
	color: green;
	border: 2px solid #30b539;
}

.button3:hover {
	background-color: #f44336;
	color: white;
}

.button3-green:hover {
	background-color: #30b539;
	color: white;
}


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
   		<div class="dropdown nanumfont">
   		&nbsp;<b>출발공항 : &nbsp;</b><input class="input-field dia_bt area input aaa" id="txt5" value="${from}" placeholder="출발지" name="from" size="10" readonly="readonly"/>
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
    	<div class="dropdown nanumfont">
   		&nbsp;&nbsp;<b>도착공항 : &nbsp;</b><input class="input-field dia_bt2 area2 input aaa" id="txt6" value="${to}" placeholder="도착지" name="to" size="10" readonly="readonly"/>   
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
			
      		<button id="btn5" class="button button3 input-field1 juafont" style="width: 100px;">검색</button>
      		<button id="btn6" class="button button3-green input-field1 juafont" style="width: 100px;" >변경</button>
	   	 </div>	
	</div>
	
	<!-- --------신규 수정부분 안내 글자 중앙정렬 배치--------------------------------- -->
	<div class="centered"> 
		<p class="prompt"></p>		
		<p class="prompt">주어진 출발 및 도착 공항을 가진 모든 항공편의 계산 된 등급 정보를 반환합니다.</p>
		<p class="prompt">Returns the calculated ratings information for all flights having the given departure and arrival airports</p>
		<br>
	</div>
	
	<div class="centered main">
		<table id="airportRank" class="display" width="100%"></table>		
	</div>
	
	<!-- -------------------------------------------------------------------- -->
	
		 
</body>
</html>