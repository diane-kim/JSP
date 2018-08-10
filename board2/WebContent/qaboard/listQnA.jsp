<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style>
input:hover {
	text-decoration: underline;
}

a:hover {
	text-decoration: underline;
}

/* div {
	position: absolute;
	width: 1000px;
	height: 500px;
	left: 50%;
	top: 50%;
	margin: -250px 0 0 -500px;
} */
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
tr.b { border-bottom: 1px solid lightgrey; }

</style>
<title>Insert title here</title>
</head>

<body style="text-align: center">

<jsp:include page="../header.jsp"></jsp:include>
</div>

<%   %>
	<br />
	<h3>Q & A</h3>
	<div class="centered">
		<table style="width: 1000px; text-align: center;">
			<tr style="border-top: 1px solid lightgrey; height: 50px" class="b">
				<td style="width: 150px">No</td>
				<td>Subject</td>
				<td style="width: 150px">Date</td>
				<td style="width: 150px">Name</td>
				<td style="width: 100px">Read</td>
			</tr>
			<c:forEach var="l" items="${list}">
				<tr class="b">
					<td style="width: 150px">${l.qa_id}</td>
					<td>
					<a href="qaContent.khy?qa_id=${l.qa_id}">${l.qa_sub}&nbsp&nbsp</a> 
					<c:if test="${l.qa_count>0}">
					[답변 <p style="color: blue; display: inline; vertical-align:bottom">${l.qa_count}</p>]
					</c:if>
					<c:if test="${l.qa_read>100}">
							<p style="color: red; display: inline; vertical-align: bottom">hot</p>
					</c:if>
					</td>
					<td style="width: 150px">${l.qa_date}</td>
					<td style="width: 150px">${l.qa_name}</td>
					<td style="width: 100px">${l.qa_read}</td>
				</tr>
			</c:forEach>
			<c:if test="${id != null}">
			<tr style="height: 50px">
				<td colspan="4"></td>
			</tr>
			<tr style="height: 50px; text-align: right; margin: -20px;">
				<td colspan="5">
					<p style="padding: 2px 25px 3px 25px; border: 1px solid lightgrey; display: inline;">
						<a href="qaboard/writeQnA.jsp" style="color: grey">WRITE</a>
					</p>
				</td>
			</tr>
			<tr style="height: 50px">
				<td colspan="5" style="text-align: left">
					<form action=" ">
						&nbsp&nbsp <input type="text" name="search"><input
							type="submit" value="search">
					</form>
			</tr>
			</c:if>
		</table>
	</div>
	
<jsp:include page="../footer.html"/>
</body>
</html>