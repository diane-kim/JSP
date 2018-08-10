<%@page import="board.file.FileDTO"%>
<%@page import="board.file.FileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<jsp:useBean id="b" class="board.file.FileDTO" />
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
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>

	<%
		String count = request.getParameter("key");
			int cast = Integer.parseInt(count);
			board.file.FileDAO dao = new board.file.FileDAO();

			FileDTO dto = dao.contentView(cast);
	%>
	<div class="container">
		<div class="text-center">
			<img src="../image/<%=dto.getFileName()%>" class="rounded">
			<br><br><br><br><br><br>
			<img src="../image/<%=dto.getFileName2()%>" class="img-fluid">
		</div>
		<div>
			<a href="list.jsp">


				<button type="button" class="btn btn-secondary btn-sm font2">돌아가기</button>
			</a> <a href="update.jsp?key=<%=count%>">
				<button type="button" class="btn btn-secondary btn-sm font2">수정</button>
			</a> <a href="delset.jsp?key=<%=count%>">
				<button type="button" class="btn btn-secondary btn-sm font2">삭제</button>
			</a> <br>
			<%=dto.getContent()%>
			<br>
			<%=dto.getTitle()%>
			<br>
		</div>
	</div>
</body>
</html>

