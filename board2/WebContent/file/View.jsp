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
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<br>
	<br>

	<%
		String count = request.getParameter("key");
		int cast = Integer.parseInt(count);
		board.file.FileDAO dao = new board.file.FileDAO();

		FileDTO dto = dao.contentView(cast);
	%>
	<div class="centered">
		<table
			style="width: 1000px; text-align: center; border: 1px solid lightgrey;">
			<tr>
				<td><br><img src="../image/<%=dto.getFileName()%>" class="rounded"></td>
				<td><%=dto.getTitle()%><br><%=dto.getContent()%></td>
			</tr>
			<tr>
				<td colspan="2"><img src="../image/<%=dto.getFileName2()%>"
					class="img-fluid"></td>
			</tr>
		</table>
		<br>


	<div align="right">
		<p style="padding: 2px 25px 3px 25px; border: 1px solid lightgrey; display: inline;">
			<a href="<%=request.getContextPath()%>/file/list.jsp">List</a>
		</p>

		<% if(("admin").equals(session.getAttribute("id"))) {%>
		<p style="padding: 2px 25px 3px 25px; border: 1px solid lightgrey; display: inline;">
			<a href="<%=request.getContextPath()%>/file/update.jsp?key=<%=count%>">수정</a>
		</p>
		
		<p style="padding: 2px 25px 3px 25px; border: 1px solid lightgrey; display: inline;">
			<a href="<%=request.getContextPath()%>/file/delset.jsp?key=<%=count%>">삭제</a>
		</p>
		<%} %>
		</div>
	
		<form action="writeReply.khy">
			<input type="hidden" name="qa_id" value="${dto.qa_id}">
			<fieldset style="border: 1px solid lightgrey">
				<p style="padding: 10px 0px 0px 5px;">
					<strong> COMMENT</strong>
				</p>
				<textarea name="comment"
					style="width: 900px; height: 100px; margin: 10px; resize: none"></textarea>
				<p style="text-align: right; padding: 20px 30px 5px 5px;">
					<input type="submit" value="WRITE"
						style="padding: 5px 25px 5px 25px; border: 1px solid lightgrey; background-color: white; color: grey">
				</p>
			</fieldset>
		</form>
		</div>
		
<!--  	<div id="SP_goTopEnd" style="opacity: 1; display: block;">
		<a class="goKakaoTalk" onclick="window.open('https://lc1.lunasoft.co.kr/lunachat/api-connect/@secretlabel/main');" href="#">
		<img src="http://cdn1-aka.makeshop.co.kr/design/label55/smartpc/custom_img/top_down_bt1.png"></a>
		<a class="goTop" href="#header"><img src="http://cdn1-aka.makeshop.co.kr/design/label55/smartpc/custom_img/top_down_bt2.png"></a>
		<a class="goEnd" href="#footer"><img src="http://cdn1-aka.makeshop.co.kr/design/label55/smartpc/custom_img/top_down_bt3.png"></a>
	</div>  -->	
</body>
</html>

