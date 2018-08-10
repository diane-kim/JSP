<%@page import="board.file.FileDAO"%>
<%@page import="board.file.FileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<style>
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<div class="container centered">

		<%
		String word = request.getParameter("word");		
		String col = request.getParameter("col");
		String key = request.getParameter("key");
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		if (col == null && word == null)
		{
		%>

		<div class="row">

			<%
				board.file.FileDAO dao = new board.file.FileDAO();
				String count = request.getParameter("key");
				List<FileDTO> list = dao.fileList(count);
				
				
				for (board.file.FileDTO dto : list) { 
			%>
			<div class="col-3">
				<a href="View.jsp?key=<%=dto.getCount()%>">
				<img class="img-thumbnail" src="../image/<%=dto.getFileName()%>"
						alt="Card image cap"></a>
			</div>
			<%
			}
			%>
		</div>

		<div>
			<%
				
			%>
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%
						board.file.FileDAO dao2 = new board.file.FileDAO();
						board.file.FileNextListDTO fnldto = dao2.fileNextList(count);
						int page1 = fnldto.getPage1();
						int startPage = fnldto.getStartPage();
						int endPage = fnldto.getEndPage();
						int totalPage = fnldto.getTotalPage();

						if (page1 >= 1) {
							page1 = 2;
					%> <a class="page-link" href="list.jsp?key=<%=(page1 - 1)%>">Previous</a>
				</li>
				<%
					}
				%>

				<%
					for (int iCount = startPage; iCount <= endPage; iCount++) { //1~10 11~20 .... 이부분에 html 와야함
				%>
				<li class="page-item"><a class="page-link"
					href="list.jsp?key=<%=iCount%>"><%=iCount%></a></li>
				<%
					}
				%>

				<%
					if (page1 <= totalPage) {
						page1 = totalPage - 1;
				%>
				<li class="page-item"><a class="page-link"
					href="list.jsp?key=<%=(page1 + 1)%>">Next</a></li>
				<%
					}
				int page2 = 2;
				%>
			</ul>
			</nav>
		</div>
		<% 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		}else{ 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		%>

		<div class="row">

			<%
				board.file.FileDAO dao = new board.file.FileDAO();
				String count = request.getParameter("key");
				List<FileDTO> list = dao.fileSearchList(count,word);

				for (board.file.FileDTO dto : list) { 
			%>
			<div class="col-3">
				<a href="View.jsp?key=<%=dto.getCount()%>">
				<img class="img-thumbnail" src="../image/<%=dto.getFileName()%>"
						alt="Card image cap"></a>
			</div>
			<%
			}
			%>
		</div>

		<div>
			<%
				
			%>
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%
						board.file.FileDAO dao2 = new board.file.FileDAO();
						board.file.FileNextListDTO fnldto = dao2.fileNextListTwo(count,list.size());
						int page1 = fnldto.getPage1();
						int startPage = fnldto.getStartPage();
						int endPage = fnldto.getEndPage();
						int totalPage = fnldto.getTotalPage();

						if (page1 >= 1) {
							page1 = 2;
					%> <a class="page-link" href="list.jsp?key=<%=(page1 - 1)%>">Previous</a>
				</li>
				<%
					}
				%>

				<%
					for (int iCount = startPage; iCount <= endPage; iCount++) { //1~10 11~20 .... 이부분에 html 와야함
				%>
				<li class="page-item"><a class="page-link"
					href="list.jsp?key=<%=iCount%>"><%=iCount%></a></li>
				<%
					}
				%>

				<%
					if (page1 <= totalPage) {
						page1 = totalPage - 1;
				%>
				<li class="page-item"><a class="page-link"
					href="list.jsp?key=<%=(page1 + 1)%>">Next</a></li>
				<%
					}
				int page2 = 2;
				%>
			</ul>
			</nav>
		</div>
		<%} 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		%>

		<div align="right">
			<a href="input.jsp">
				<button type="button" class="btn btn-outline-primary font2">사진업로드</button>
			</a>
		</div>

		<DIV class='aside_menu'>
			<FORM name='frm' method='GET' action='list.jsp'>
				<ASIDE style='float: right;'> <SELECT name='col'>
					<!-- 검색 컬럼 -->
					<OPTION value='none'>전체 목록</OPTION>
					<OPTION value='content'>내용</OPTION>
				</SELECT> <input type='text' name='word' size='20' value=''>
				<button type='submit'>검색</button>
				</ASIDE>
			</FORM>
			<DIV class='menu_line' style='clear: both;'></DIV>
		</DIV>
	</div>
</body>
</html>