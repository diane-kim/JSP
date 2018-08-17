<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.td_color {
	background-color: #EAEAEA;
	font-size: 13px;
}

.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}

a:hover {
	text-decoration: underline;
}

a {
	color: grey;
}

tr.b {
	border-bottom: 1px solid lightgrey;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<table style="width: 1000px; text-align: center;">
			<tr style="color: grey; height: 50px" class="b">
				<td style="width: 30px">순번</td>
				<td style="width: 30px">id</td>
				<td style="width: 50px">이름</td>
				<td style="width: 50px">상태</td>
				<td style="width: 50px">시간</td>
			</tr>
			<c:forEach var="l" items="${list}">
				<tr class="b">
					<td style="width: 100px; height: 65px">${l.log_num}</td>
					<td style="width: 100px; height: 65px">${l.log_id}</td>
					<td style="width: 100px" >${l.log_name}</td>
					
					<c:if test="${l.record eq 'login'}">
					<td style="color:green">${l.record}</td>					
					</c:if>
					<c:if test="${l.record eq 'logout'}">
					<td style="color:red">${l.record}</td>					
					</c:if>	
									
					<td style="width: 100px">${l.log_time}</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>