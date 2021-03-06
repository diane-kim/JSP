<%@page import="com.javalec.ex03.BoardDTO"%>
<%@page import="com.javalec.ex03.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
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
<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho"
	rel="stylesheet">
<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

.font2 {
	font-family: 'Gaegu', cursive;
	font-size: 20px;
	font-color: grey;
}

.font {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 20px;
}

.td_color {
	background-color: #EAEAEA;
	font-size: 13px;
}

td, th {
	border: 0.2px solid gray;
	margin: 10px;
	padding: 10px;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	color: rgba(0, 0, 0, 0); //
	숨긴다 opacity: 1;
	display: block;
	background:
		url(https://mywildalberta.ca/images/GFX-MWA-Parks-Reservations.png)
		no-repeat; // 대체할 아이콘 width : 20px;
	height: 20px;
	border-width: thin;
}

.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}

input::placeholder {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 18px;
}

textarea::placeholder {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 18px;
}
</style>
</head>
<body>
	<br>
	<br>

	<%
		String count = request.getParameter("key");
		int cast = Integer.parseInt(count);
		BoardDAO boardDAO = new BoardDAO();

		BoardDTO dto = boardDAO.contentView(cast);
	%>

	<div class="centered">
		<div class="shadow p-3 mb-5 bg-white rounded">
			<table border="1" rules="rows" cellpadding="0" cellspacing="0"
				class="table table-bordered">
				<tr>
					<td class="td_color text-center"><b class="font2">작성자</b></td>
					<td><%=dto.getName()%></td>
					<td class="td_color text-center"><b class="font2">작성일자</b></td>
					<td><%=dto.getDate()%></td>
				</tr>
				<tr>
					<td class="td_color text-center"><b class="font2">제목</b></td>
					<td colspan="4"><%=dto.getTitle()%></td>
				</tr>
				<tr>
					<td colspan="5" width="700"><%=dto.getContent()%></td>
				</tr>
				<tr>
					<td colspan="5" align="right"><a href="list.jsp">
							<button type="button" class="btn btn-secondary btn-sm font2">돌아가기</button>
					</a> <a href="updateboard.jsp?key=<%=count%>">
							<button type="button" class="btn btn-secondary btn-sm font2">수정</button>
					</a> <a href="deleteDB.jsp?key=<%=count%>">
							<button type="button" class="btn btn-secondary btn-sm font2">삭제</button>
					</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

