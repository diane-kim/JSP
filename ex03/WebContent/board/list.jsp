<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="b" class="com.javalec.ex03.BoardDTO" />
<jsp:setProperty name="b" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td, th {
	border: 0.2px solid gray;
	margin: 10px;
	padding: 10px;
}

.td_color {
	background-color: #EAEAEA;
	font-size: 13px;
}

.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<br>
	<br>
	<div class="centered">
		<table border="1" rules="rows" width="750" cellpadding="0"
			cellspacing="0">
			<tr>
				<th class="td_color">순번
				</td>
				<th class="td_color">작성자
				</td>
				<th class="td_color">작성일자
				</td>
				<th class="td_color">제목
				</td>
			</tr>

			<tr>
				<td><jsp:getProperty name="b" property="count" /></td>
				<td><jsp:getProperty name="b" property="name" /></td>
				<td><jsp:getProperty name="b" property="date" /></td>
				<td><jsp:getProperty name="b" property="title" /></td>
			</tr>
		</table>
	</div>
</body>
</html>