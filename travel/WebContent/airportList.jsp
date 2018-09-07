<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>운항정보</title>
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
<script src="<%=request.getContextPath()%>/js/airportList.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/session.js" type="text/javascript"></script>

<% String id = (String)session.getAttribute("id");%>
</head>
<body class="w3-light-grey" contenteditable="false">

<jsp:include page="Rheader.jsp"/>
<jsp:include page="member/loginform.jsp" />
<jsp:include page="rank.jsp"/>
<jsp:include page="sidebar.jsp"/>

	<div class="centered main">
	<br><br><br><br>	
<!--  항공편 드롭다운 -->	
		<div class="input-container">	
		
		<form action="/travel/AirportTest.al">
   		<div class="dropdown">
   		&nbsp;출발공항: <input class="input-field dia_bt area input aaa" id="txt1" value="<%=session.getAttribute("from")%>" placeholder="출발지" name="from" size="10" readonly="readonly"/>
    		<div class="dropdown-content area">
    			<table class="area">
    				<tr class="trr"><td><h4 class="area" ><b class="area">국내</b></h4></td></tr>
    				<tr class="trr"><td><a class="contury" href="#;">인천</a></td><td><a class="contury" href="#;">서울</a></td><td><a class="contury" href="#;">부산</a></td><td><a class="contury" href="#;">제주</a></td></tr>
    				<tr class="trr"><td><h4 class="area"><b class="area">중화권</b></h4></td></tr>
    				<tr class="trr"><td><a class="contury" href="#;">홍콩</a></td><td><a class="contury" href="#;">타이페이</a></td><td><a class="contury" href="#;">마카오</a></td><td><a class="contury" href="#;">상하이</a></td><td><a class="contury" href="#;">베이징</a></td><td><a class="contury" href="#;">칭다오</a></td></tr>
    				<tr class="trr"><td><h4 class="area"><b class="area">아시아</b></h4></td></tr>
    				<tr class="trr"><td><a class="contury" href="#;">도쿄</a></td><td><a class="contury" href="#;">싱가포르</a></td><td><a class="contury" href="#;">방콕</a></td><td><a class="contury" href="#;">마닐라</a></td><td><a class="contury" href="#;">쿠알라룸푸르</a></td><td><a class="contury" href="#;">하노이</a></td></tr>
    				<tr class="trr"><td><h4 class="area"><b class="area">미주/유럽</b></h4></td></tr>      
	    			<tr class="trr"><td><a class="contury" href="#;">런던</a></td><td><a class="contury" href="#;">파리</a></td><td><a class="contury" href="#;">로마</a></td><td><a class="contury" href="#;">로스앤젤레스</a></td><td><a class="contury" href="#;">뉴욕</a></td><td><a class="contury" href="#;">샌프란시스코</a></td></tr>
    			</table>
      		</div>
    	</div>   
    	<div class="dropdown">
   		&nbsp;도착공항: <input class="input-field dia_bt2 area2 input aaa" id="txt2" value="<%=session.getAttribute("to")%>" placeholder="도착지" name="to" size="10" readonly="readonly"/>   
    		<div class="dropdown2-content area2">
      			<table class="area2">
      				<tr class="trr"><td class="area2"><h4><b>국내</b></h4></td></tr>
      				<tr class="trr"><td><a class="tocontury" href="#;">인천</a></td><td><a class="tocontury" href="#;">서울</a></td><td><a class="tocontury" href="#;">부산</a></td><td><a class="tocontury" href="#;">제주</a></td></tr>
      				<tr class="trr"><td class="area2"><h4><b>중화권</b></h4></td></tr>
      				<tr class="trr"><td><a class="tocontury" href="#;">홍콩</a></td><td><a class="tocontury" href="#;">타이페이</a></td><td><a class="tocontury" href="#;">마카오</a></td><td><a class="tocontury" href="#;">상하이</a></td><td><a class="tocontury" href="#;">베이징</a></td><td><a class="tocontury" href="#;">칭다오</a></td></tr>
     				<tr class="trr"><td class="area2"><h4><b>아시아</b></h4></td></tr>
      				<tr class="trr"><td><a class="tocontury" href="#;">도쿄</a></td><td><a class="tocontury" href="#;">싱가포르</a></td><td><a class="tocontury" href="#;">방콕</a></td><td><a class="tocontury" href="#;">마닐라</a></td><td><a class="tocontury" href="#;">쿠알라룸푸르</a></td><td><a class="tocontury" href="#;">하노이</a></td></tr>
      				<tr class="trr"><td class="area2"><h4><b>미주/유럽</b></h4></td></tr>      
      				<tr class="trr"><td><a class="tocontury" href="#;">런던</a></td><td><a class="tocontury" href="#;">파리</a></td><td><a class="tocontury" href="#;">로마</a></td><td><a class="tocontury" href="#;">로스앤젤레스</a></td><td><a class="tocontury" href="#;">뉴욕</a></td><td><a class="tocontury" href="#;">샌프란시스코</a></td></tr>
      			</table>
      		</div>
    	</div>  
    	<input type="hidden" name="f"/>
  		<input type="hidden" name="t"/>
    	<div class="relative">  
    	  	&nbsp;출발날짜: <input class="input-field testDatepicker input aaa" id="txt3" value="<%=session.getAttribute("fromdate")%>" size="10" readonly="readonly" name="fromdate"/>      		
      		</div>  
      		<button id="btn" class="btn2 default input-field"  onclick="reserv('<%=session.getAttribute("f")%>','<%=session.getAttribute("t")%>','<%=session.getAttribute("fromdate")%>','<%=session.getAttribute("todate")%>','<%=session.getAttribute("num")%>','<%=session.getAttribute("seat")%>')">검색</button>      		
    	</div>	
    	</form>
    	
    	<button id="btn2" class="btn2 default input-field" >변경</button>
    	<p class="prompt">표시 금액은 1인당 운임입니다 (예상 TAX 및 유류할증료 포함)  모든 출발·도착 시간은 현지 시각 기준입니다</p>
		<table id="realTime" class="display table" width="100%"></table>		
	</div>  

</body>
</html>