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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/airport.css" type="text/css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<!--  달력 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /><!--  jQuery UI CSS파일-->  
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  <!--  jQuery 기본 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script><!-- jQuery UI 라이브러리 js파일  -->
<!--  달력 -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/js/airportList.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/SearchViewCheck.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/SearchViewSubmitCheck.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/GoogleMapMark.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/SearchView.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs"></script>

<% String id = (String)session.getAttribute("id");%>
</head>
<body class="w3-light-grey" contenteditable="false">

<jsp:include page="Rheader.jsp"/>
<jsp:include page="member/loginform.jsp" />
<jsp:include page="rank.jsp"/>
<jsp:include page="sidebar.jsp"/>

	<div class="centered main">
	<br><br><br><br>	
	
	<form name="MarkMap" action="<%=request.getContextPath()%>/AirportList.al" style="max-width:1100px; margin:auto" onsubmit="return check()">
   	<div class="input-container">
   		<i class="fa fa-plane icon" style="font-size:24px"></i>	 <!-- 비행기 아이콘 -->
   		
   		<div class="dropdown">
    		
    		<input class="dia_bt input-field area bbb input" type="text" id="txt1" placeholder="출발지" name="f" readonly="readonly">
    		
    		<div class="dropdown-content area">
    			<table class="area table">
    				<tr class="tr"><td class="area td"><h4><b>국내</b></h4></td></tr>
    				<tr class="tr"><td class="td"><a class ="contury" href="#;">인천</a></td><td class="td"><a class ="contury" href="#;">서울</a></td><td class="td"><a class ="contury" href="#;">부산</a></td><td class="td"><a class ="contury" href="#;">제주</a></td></tr>
    				<tr class="tr"><td class="area td"><h4><b>중화권</b></h4></td></tr>
    				<tr class="tr"><td class="td"><a class ="contury" href="#;">홍콩</a></td><td class="td"><a class ="contury" href="#;">타이페이</a></td><td class="td"><a class ="contury" href="#;">마카오</a></td><td class="td"><a class ="contury" href="#;">상하이</a></td><td class="td"><a class ="contury" href="#;">베이징</a></td><td class="td"><a class ="contury" href="#;">칭다오</a></td></tr>
    				<tr class="tr"><td class="area td"><h4><b>아시아</b></h4></td></tr>
    				<tr class="tr"><td class="td"><a class ="contury" href="#;">도쿄</a></td><td class="td"><a class ="contury" href="#;">싱가포르</a></td><td class="td"><a class ="contury" href="#;">방콕</a></td><td class="td"><a class ="contury" href="#;">마닐라</a></td><td class="td"><a class ="contury" href="#;">쿠알라룸푸르</a></td><td class="td"><a class ="contury" href="#;">하노이</a></td></tr>
    				<tr class="tr"><td class="area td"><h4><b>미주/유럽</b></h4></td></tr>      
	    			<tr class="tr"><td class="td"><a class ="contury" href="#;">런던</a></td><td class="td"><a class ="contury" href="#;">파리</a></td><td class="td"><a class ="contury" href="#;">로마</a></td><td class="td"><a class ="contury" href="#;">로스앤젤레스</a></td><td class="td"><a class ="contury" href="#;">뉴욕</a></td><td class="td"><a class ="contury" href="#;">샌프란시스코</a></td></tr>
    			</table>
      		</div>
    	</div>
    	
    	
		<i class="fa fa-plane icon" style="font-size:24px" ></i>
    	<div class="dropdown2">   
    		<input class="dia_bt2 input-field area2 bbb input" type="text"  id="txt2" placeholder="도착지" name="t" readonly="readonly">
    		<div class="dropdown2-content area2">
      			<table class="area2 table">
      				<tr class="tr"><td class="area2 td"><h4><b>국내</b></h4></td></tr>
      				<tr class="tr"><td class="td"><a class ="tocontury" href="#;">인천</a></td><td class="td"><a class ="tocontury" href="#;">서울</a></td><td class="td"><a class ="tocontury" href="#;">부산</a></td><td class="td"><a class ="tocontury" href="#;">제주</a></td></tr>
      				<tr class="tr"><td class="area2 td"><h4><b>중화권</b></h4></td></tr>
      				<tr class="tr"><td class="td"><a class ="tocontury" href="#;">홍콩</a></td><td class="td"><a class ="tocontury" href="#;">타이페이</a></td><td class="td"><a class ="tocontury" href="#;">마카오</a></td><td class="td"><a class ="tocontury" href="#;">상하이</a></td><td class="td"><a class ="tocontury" href="#;">베이징</a></td><td class="td"><a class ="tocontury" href="#;">칭다오</a></td></tr>
     				<tr class="tr"><td class="area2 td"><h4><b>아시아</b></h4></td></tr>
      				<tr class="tr"><td class="td"><a class ="tocontury" href="#;">도쿄</a></td><td class="td"><a class ="tocontury" href="#;">싱가포르</a></td><td class="td"><a class ="tocontury" href="#;">방콕</a></td><td class="td"><a class ="tocontury" href="#;">마닐라</a></td><td class="td"><a class ="tocontury" href="#;">쿠알라룸푸르</a></td><td class="td"><a class ="tocontury" href="#;">하노이</a></td></tr>
      				<tr class="tr"><td class="area2 td"><h4><b>미주/유럽</b></h4></td></tr>      
      				<tr class="tr"><td class="td"><a class ="tocontury" href="#;">런던</a></td><td class="td"><a class ="tocontury" href="#;">파리</a></td><td class="td"><a class ="tocontury" href="#;">로마</a></td><td class="td"><a class ="tocontury" href="#;">로스앤젤레스</a></td><td class="td"><a class ="tocontury" href="#;">뉴욕</a></td><td class="td"><a class ="tocontury" href="#;">샌프란시스코</a></td></tr>
      			</table>
      		</div>
    	</div>   
  	</div>
  <div class="input-container">
  	<i class="fa fa-calendar icon" style="font-size:24px"></i> <!-- 달력 아이콘  -->
    <input class="input-field testDatepicker bbb input" type="text" placeholder="출발날짜" name="fromdate" id="fromdate" readonly="readonly">
    <i class="fa fa-calendar icon" style="font-size:24px"></i>
    <input class="input-field testDatepicker bbb input" type="text" placeholder="도착날짜" name="todate" id="todate" readonly="readonly">
  </div>
  
  
  <div class="input-container">	
  	<h2><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	성인&nbsp;&nbsp;</b> </h2>
  	
    <a href="javascript:;" style="font-size:30px" class="bt_up fa fa-plus cal no-uline " > </a> <!-- 숫자 부분  -->
    <input class="num input" type="text" placeholder="성인" value="0" readonly="readonly" name="num">
    

    <a href="javascript:;" style="font-size:30px" class="bt_down fa fa-minus cal no-uline" > </a> <!-- 좌석 등급 부분  -->
    
    <h2><b>&nbsp;&nbsp;&nbsp;&nbsp;좌석 등급 &nbsp;&nbsp;&nbsp;</b></h2>
    <select name="seat" font-size="10px">
    	<option value="일반"><b>일반</b></option>
    	<option value="비즈니스"><b>비즈니스</b></option>
    </select>
  </div>
  
	<input type="hidden" name="from"/>
	<input type="hidden" name="to"/>
	<input type="hidden" id="fromName" name="fromName">
	<input type="hidden" id="toName" name="toName"> 
	<input type="hidden" id="fromLatitude" name="fromLatitude">
	<input type="hidden" id="fromLongitude" name="fromLongitude"> 
	<input type="hidden" id="toLatitude" name="toLatitude">
	<input type="hidden" id="toLongitude" name="toLongitude">
	<input type="hidden" id="toCountryCode" name="toCountryCode">
	<input type="hidden" id="fromCountryCode" name="fromCountryCode">
  
<!--   <button  class="btn" id="getBtn">조회</button><br><br><br><br> -->
  <button type="button" id="btn" class="btn2 default input-field" >조회</button>
  <button id="btn2" class="btn2 default input-field" >변경</button>
</form>
<c:if test="${check2==1}">

<script> reserv('${f}','${t}','${fromdate}','${todate}','${num}','${seat}'); getAirLine('${from}','${to}','${fromdate}');
</script>

</c:if>
    	
    	<p class="prompt">표시 금액은 1인당 운임입니다 (예상 TAX 및 유류할증료 포함)  모든 출발·도착 시간은 현지 시각 기준입니다</p>

		<div class="dropdown3-content centered">
				
    	<div class="slideshow-container">
			<c:forEach var="l" items="${list}">
				<div class="mySlides fade">
					<div class="numbertext">${l.count}/ ${list.size()}</div>
						<img class="img" src="<%=request.getContextPath()%>/img/${l.fileName}" style="width: 100%;height:400px;">
				</div>
			</c:forEach>
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> 
			<a class="next2" onclick="plusSlides(1)">&#10095;</a>
		</div>
		<br>
		<div style="text-align: center">
			<c:forEach var="l" items="${list}">
				<span class="dot" onclick="currentSlide(${l.count})"></span>
			</c:forEach>
		</div>

				<br>
				<div class="w3-half w3-container">
						<jsp:include page="mapmark.jsp">
							<jsp:param value="1" name="check"/>
					        <jsp:param value="${dto.fromName}" name="dtoFromName"/>
					        <jsp:param value="${dto.toName}" name="dtoToName"/>
					        <jsp:param value="${dto.fromLatitude}" name="dtoFromLatitude"/>
					        <jsp:param value="${dto.toLatitude}" name="dtoToLatitude"/>        
					        <jsp:param value="${dto.fromLongitude}" name="dtoFromLongitude"/>       
					        <jsp:param value="${dto.toLongitude}" name="dtoToLongitude"/>
						</jsp:include>	 
				</div>			
		</div>
		
		<br><br>

		<table id="realTime" class="display table" width="100%"></table>	
</body>
</html>