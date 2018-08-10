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
	border: 1px solid lightgrey;
}

tr.a{
	border-bottom: 1px solid lightgrey
}

p {
	padding: 5px 25px 5px 25px;
	border: 1px solid lightgrey;
	display: inline;
}

#btn {
	background-color: white;
	border: 0px;
	color: grey
}
</style>
</head>
<body style="text-align: center">
<% String qa_id = request.getParameter("qa_id");
   String qa_name = request.getParameter("qa_name");
   String qa_con = request.getParameter("qa_con");%>
	<br />
	<br />
	<h3 style="text-decoration: underline">Q & A</h3>
	<div>
		<form action="/board2/modifyQnA.khy" method="post">
			<table style="text-align: left;" class="a">
				<tr style="border-top: 1px solid lightgrey; height: 50px" class="a">
					<td colspan="2">&nbsp&nbsp Subject &nbsp&nbsp <select
						name="subject" style="width: 150px">
							<option selected>문의 사항</option>
							<option>상품문의</option>
							<option>배송문의</option>
							<option>교환&환불문의</option>
							<option>기타</option>
					</select></td>
				</tr>
				<tr style="height: 50px;" class="a">
					<td style="width: 150px;">&nbsp&nbsp Name <%= qa_name %></td>
					<td>Date</td>
				</tr>
				<tr style="height: 300px; text-align: center" class="a">
					<td colspan="2">
					<textarea name="content" style="width: 900px; height: 250px; resize: none;">
					<%= qa_con %>		
					</textarea></td>
				</tr>
				<tr style="height: 50px;" class="a">
					<td style="width: 150px"></td>
					<td><input type="hidden" name="qa_id" value="<%= qa_id%>">
					</td>
				</tr>
			</table>
			<table style="width: 1000px; text-align: right;">
				<tr>
					<td>
						<br/>
						<p><input type="reset" value="RESET" id="btn"></p>
						<p><input type="submit" value="EDIT" id="btn"></p>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>