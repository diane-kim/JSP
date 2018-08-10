<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style>
<!--스타일 시트 -->
input:hover {
	text-decoration: underline;
}

a:hover {
	text-decoration: underline;
}

div {
	position: absolute;
	width: 1000px;
	height: 500px;
	left: 50%;
	top: 50%;
	margin: -250px 0 0 -500px;
}

table.a {
	width: 1000px;
	text-align: left;
	border: 1px solid lightgrey;
}

tr {
	border-bottom: 1px solid lightgrey;
}

p.a {
	padding: 5px 25px 5px 25px;
	border: 1px solid lightgrey;
	display: inline;
}
</style>
</head>
<body style="text-align: center">

	<br />
	<br />
	<h3 style="text-decoration: underline">Q & A</h3>
	<div>
		<!--  QnA 내용보기  -->
		<form action="qaboard/pwdOk.jsp" method="get">
			<table class="a">
				<tr style="border-top: 1px solid lightgrey; height: 50px">
					<td colspan="2">&nbsp&nbsp Subject ${dto.qa_sub} <input
						type="hidden" name="subject" value="${dto.qa_sub}"></td>
				</tr>
				<tr style="height: 50px;">
					<td style="width: 150px;">&nbsp&nbsp Name ${dto.qa_name} <input
						type="hidden" name="qa_name" value="${dto.qa_name}"></td>
					<td>Date ${dto.qa_date}</td>
				</tr>
				<tr style="height: 300px; text-align:center">
					<td colspan="2"><p>${dto.qa_con}</p><input type="hidden"
						name="qa_con" value="${dto.qa_con}"></td>
				</tr>
				<tr style="height: 50px;">
					<td style="width: 150px">&nbsp&nbsp Password</td>
					<td><input type="password" name="delPwd">&nbsp&nbsp
						삭제하려면 비밀번호를 입력하세요. <input type="hidden" name="qa_id"
						value="${dto.qa_id}"></td>
				</tr>
			</table>
			<!-- 버튼 , delete 누르면  form태그로 전송 비밀번호 체크  -->
			<table style="width: 1000px; text-align: right;">
				<tr style="border: 0px">
					<td><br />
						<p class="a">
							<a href="/board2/qaList.khy" style="color: grey">LIST</a>
						</p>&nbsp
						<p class="a">
							<a
								href="qaboard/modifyQnA.jsp?qa_id=${dto.qa_id}&qa_name=${dto.qa_name}&qa_con=${dto.qa_con}"
								style="color: grey">EDIT</a>
						</p>&nbsp
						<p class="a">
							<input type="submit" value="DELETE" name="submit"
								style="background-color: white; border: 0px; color: grey">
						</p></td>
				</tr>
			</table>
		</form>
		<br />
		<!-- 답글 목록 보기 ,id가 admin이면 삭제 버튼 생김 , reply 보류  -->
		<c:forEach var="l" items="${rList}">
			<table style="width: 1000px; border: 1px solid lightgrey;">
				<tr style="height: 30px; text-align: left">
					<td style="width: 150px;">&nbsp&nbsp Name &nbsp&nbsp
						${l.re_name}</td>
					<td>Date &nbsp&nbsp ${l.re_date}</td>
					<td style="text-align: right">
						<%-- <c:if test="${id = 'admin'}"> --%>
						<p class="a" style="padding: 2px 25px 3px 25px;">
							<a href="" style="color: grey">REPLY</a>
						</p>
						<p class="a" style="padding: 2px 25px 3px 25px;">
							<a href="/board2/ReplyDelete.khy?re_id=${l.re_id}&qa_id=${dto.qa_id}"
								style="color: grey">DELETE</a>
						</p> <%-- </c:if> --%>
					</td>
				</tr>
				<tr style="height: 100px;">
					<td colspan="3">${l.re_con}</td>
				</tr>
			</table>
			<br />
		</c:forEach>
		<!--  답글 작성 현재 admin만 작성 가능, 답글에 답글 가능하도록 추후 변경  -->
		<br />
		<br />
		<% if(("admin").equals(session.getAttribute("id"))) {%>
		<c:if test="${dto.qa_count<=3}">
		<form action="/board2/writeReply.khy">
			<input type="hidden" name="qa_id" value="${dto.qa_id}">
			<fieldset style="border: 1px solid lightgrey">
				<p style="padding: 10px 0px 0px 5px;">
					<strong> COMMENT</strong>
				</p>
				<textarea name="comment"
					style="width: 900px; height: 100px; margin: -10px; resize: none"></textarea>
				<p style="text-align: right; padding: 20px 30px 5px 5px;">
					<input type="submit" value="WRITE"
						style="padding: 5px 25px 5px 25px; border: 1px solid lightgrey; background-color: white; color: grey">
				</p>
			</fieldset>
		</form>
		</c:if> <% } %>
		<p style="height: 500px">
			<br />
			<br />
			<br />
			<br />
		</p>
	</div>


</body>
</html>