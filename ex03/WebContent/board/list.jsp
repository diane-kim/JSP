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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Insert title here</title>
<style>

@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
.font {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 20px;
}

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
	<div class="shadow p-3 mb-5 bg-white rounded">
		<table border="1" rules="rows" width="750" cellpadding="0"
			cellspacing="0" class="table table-bordered">
			<tr>
				<td class="td_color text-center" width="50px"><b class="font">순번</b>
				</td>
				<td class="td_color text-center" width="500px"><b class="font">제목</b>				
				</td>
				<td class="td_color text-center"><b class="font">작성자</b>
				</td>
				<td class="td_color text-center"><b class="font">작성일자</b>
				</td>
			</tr>

			<tr>
				<td><jsp:getProperty name="b" property="count" /></td>
				<td><jsp:getProperty name="b" property="title" /></td>
				<td><jsp:getProperty name="b" property="name" /></td>
				<td><jsp:getProperty name="b" property="date" /></td>				
			</tr>
		</table>
		</div>
	</div>
</body>
</html>