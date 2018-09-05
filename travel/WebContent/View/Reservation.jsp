<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="<%=request.getContextPath()%>/js/ReservationCheck.js" type="text/javascript"></script>
</head>
<body>
<c:if test="${check==1}">
<script>alert("로그인후 이용 가능합니다."); location.href="<%= request.getContextPath() %>/imageList.mjy";

</script>
</c:if>

<div style="max-width:1000px; margin:50px">

 <table border="1">
  	
 	<tr>
 		<td colspan="2">출발지 : ${from}</td><td colspan="2">도착지 : ${to}</td>
 	</tr>
 	<tr>
 		<td>출발날짜: ${fromdate} 비행기번호 : ${al}</td><td colspan="2">성인 : ${num}, 좌석: ${seat}, 가격 : ${price}</td> <td>총금액 : ${TotalPrice}</td>
 	</tr>
   	<tr>
   		<td colspan="2">항공사 : ${ac}</td> <td>출발시간 : ${fromdate}/${dt}</td><td>도착시간 : ${todate}/${at}</td>
   	</tr>
   	    
  </table>
</div>
  
<div style="max-width:1000px; margin:50px">
	<form action="./AirportPayment.al" onsubmit="return check()" method="post">  
  		<table border="1">  	
 			<tr><td>성</td><td>이름</td><td>국적</td></tr>
 			<tr><td><input type="text" placeholder="예:HONG" name="성" maxlength="10"></td>
 				<td><input type="text" placeholder="예:GILDONG" name="이름" maxlength="30"></td>
 				<td><select name="nationality" >
    					<option value="한국" selected>한국</option>
    					<option value="일본">일본</option>
    					<option value="중국">중국</option>
    				</select> 
    			</td>
		 	</tr>
   			<tr><td>휴대전화</td><td colspan="2">이메일</td></tr>
 			<tr><td><input type="text" placeholder="예:010-1234-5678" name="휴대전화" value="${dto.phone}"></td>
 				<td colspan="2"><input type="text" placeholder="예:gildong@naver.com" name="이메일" value="${dto.email}"></td>
 			</tr> 
    		<tr><td colspan="3" align="right"><button type="submit">예약</button></td></tr>
  		</table>
  		<input type="hidden" name="출발지" value="${from}">
  		<input type="hidden" name="도착지" value="${to}">
  		<input type="hidden" name="출발날짜" value="${fromdate}">
  		<input type="hidden" name="비행기번호" value="${al}">
  		<input type="hidden" name="구매한표개수" value="${num}">
  		<input type="hidden" name="좌석유형" value="${seat}">
  		<input type="hidden" name="구매표개당가격" value="${price}">
  		<input type="hidden" name="총가격" value="${TotalPrice}">
  		<input type="hidden" name="항공사이름" value="${ac}">
  		<input type="hidden" name="출발시간" value="${dt}">
  		<input type="hidden" name="도착시간" value="${at}">
	</form>
</div>
</body>
</html>