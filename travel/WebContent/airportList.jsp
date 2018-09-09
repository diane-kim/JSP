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
<!--  항공편 조회폼 -->
<form action="<%=request.getContextPath()%>/AirportList.al" style="max-width:1100px; margin:auto" onsubmit="return check()">
   	<div class="input-container">
   		<i class="fa fa-plane icon" style="font-size:24px"></i>	 <!-- 비행기 아이콘 -->
   		
   		<div class="dropdown">
    		
    		<input id="dia_bt" class="input-field area bbb" type="text" placeholder="출발지" name="f" readonly="readonly">
    		
    		<div class="dropdown-content area">
    			<table class="area">
    				<tr><td class="area"><h4><b>국내</b></h4></td></tr>
    				<tr><td><a class ="contury" href="#;">서울</a></td><td><a class ="contury" href="#;">부산</a></td><td><a class ="contury" href="#;">제주</a></td></tr>
    				<tr><td class="area"><h4><b>중화권</b></h4></td></tr>
    				<tr><td><a class ="contury" href="#;">홍콩</a></td><td><a class ="contury" href="#;">타이페이</a></td><td><a class ="contury" href="#;">마카오</a></td><td><a class ="contury" href="#;">상하이</a></td><td><a class ="contury" href="#;">베이징</a></td><td><a class ="contury" href="#;">칭다오</a></td></tr>
    				<tr><td class="area"><h4><b>아시아</b></h4></td></tr>
    				<tr><td><a class ="contury" href="#;">도쿄</a></td><td><a class ="contury" href="#;">싱가포르</a></td><td><a class ="contury" href="#;">방콕</a></td><td><a class ="contury" href="#;">마닐라</a></td><td><a class ="contury" href="#;">쿠알라룸푸르</a></td><td><a class ="contury" href="#;">하노이</a></td></tr>
    				<tr><td class="area"><h4><b>미주/유럽</b></h4></td></tr>      
	    			<tr><td><a class ="contury" href="#;">런던</a></td><td><a class ="contury" href="#;">파리</a></td><td><a class ="contury" href="#;">로마</a></td><td><a class ="contury" href="#;">로스앤젤레스</a></td><td><a class ="contury" href="#;">뉴욕</a></td><td><a class ="contury" href="#;">샌프란시스코</a></td></tr>
    			</table>
      		</div>
    	</div>
    	
    	
		<i class="fa fa-plane icon" style="font-size:24px" ></i>
    	<div class="dropdown2">   
    		<input id="dia_bt2" class="input-field area2 bbb" type="text" placeholder="도착지" name="t" readonly="readonly">
    		<div class="dropdown2-content area2">
      			<table class="area2">
      				<tr><td class="area2"><h4><b>국내</b></h4></td></tr>
      				<tr><td><a class ="tocontury" href="#;">서울</a></td><td><a class ="tocontury" href="#;">부산</a></td><td><a class ="tocontury" href="#;">제주</a></td></tr>
      				<tr><td class="area2"><h4><b>중화권</b></h4></td></tr>
      				<tr><td><a class ="tocontury" href="#;">홍콩</a></td><td><a class ="tocontury" href="#;">타이페이</a></td><td><a class ="tocontury" href="#;">마카오</a></td><td><a class ="tocontury" href="#;">상하이</a></td><td><a class ="tocontury" href="#;">베이징</a></td><td><a class ="tocontury" href="#;">칭다오</a></td></tr>
     				<tr><td class="area2"><h4><b>아시아</b></h4></td></tr>
      				<tr><td><a class ="tocontury" href="#;">도쿄</a></td><td><a class ="tocontury" href="#;">싱가포르</a></td><td><a class ="tocontury" href="#;">방콕</a></td><td><a class ="tocontury" href="#;">마닐라</a></td><td><a class ="tocontury" href="#;">쿠알라룸푸르</a></td><td><a class ="tocontury" href="#;">하노이</a></td></tr>
      				<tr><td class="area2"><h4><b>미주/유럽</b></h4></td></tr>      
      				<tr><td><a class ="tocontury" href="#;">런던</a></td><td><a class ="tocontury" href="#;">파리</a></td><td><a class ="tocontury" href="#;">로마</a></td><td><a class ="tocontury" href="#;">로스앤젤레스</a></td><td><a class ="tocontury" href="#;">뉴욕</a></td><td><a class ="tocontury" href="#;">샌프란시스코</a></td></tr>
      			</table>
      		</div>
    	</div>   
  	</div>
  <div class="input-container">
  	<i class="fa fa-calendar icon" style="font-size:24px"></i> <!-- 달력 아이콘  -->
    <input class="input-field testDatepicker bbb" type="text" placeholder="출발날짜" name="fromdate" id="fromdate" readonly="readonly">
    <i class="fa fa-calendar icon" style="font-size:24px"></i>
    <input class="input-field testDatepicker bbb" type="text" placeholder="도착날짜" name="todate" id="todate" readonly="readonly">
  </div>
  
  
  <div class="input-container">	
  	<h2><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	성인&nbsp;&nbsp;</b> </h2>
  	
    <a href="javascript:;" style="font-size:30px" class="bt_up fa fa-plus cal no-uline " > </a> <!-- 숫자 부분  -->
    <input class="num" type="text" placeholder="성인" value="0" readonly="readonly" name="num">
    

    <a href="javascript:;" style="font-size:30px" class="bt_down fa fa-minus cal no-uline" > </a> <!-- 좌석 등급 부분  -->
    
    <h2><b>&nbsp;&nbsp;&nbsp;&nbsp;좌석 등급 &nbsp;&nbsp;&nbsp;</b></h2>
    <select name="seat" font-size="10px">
    	<option value="일반"><b>일반</b></option>
    	<option value="비즈니스"><b>비즈니스</b></option>
    </select>
  </div>
  <input type="hidden" name="from"/>
  <input type="hidden" name="to"/>
  <button type="submit" class="btn" id="getBtn">조회</button><br><br><br><br>
</form>










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