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
</style>
</head>
<body>
	<br>
	<br>
	<div class="col s12 m2">
		<div class="centered">
			<form action="inputboard.jsp" method="post">
				<div class="shadow p-3 mb-5 bg-white rounded">
					<table border="1" rules="rows" cellpadding="0" cellspacing="0"
						class="z-depth-5 table-bordered">
						<tr>
							<th class="td_color text-center"><b class="font"'>작성자</b></th>
							<td><jsp:getProperty name="b" property="name" /></td>
							<th class="td_color text-center"><b class="font">작성일자</b></th>
							<td><jsp:getProperty name="b" property="date" /></td>
						</tr>
						<tr>
							<th class="td_color text-center"><b class="font">제목</b></th>
							<td colspan="4"><jsp:getProperty name="b" property="title" /></td>
						</tr>
						<tr>
							<td colspan="5"><jsp:getProperty name="b" property="content" /></textarea></td>
						</tr>
						<tr>
							<td colspan="6" align="right"><input
								class="btn btn-secondary btn-sm" type="submit" value="등록">
								<input class="btn btn-secondary btn-sm" type="reset" value="취소"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
