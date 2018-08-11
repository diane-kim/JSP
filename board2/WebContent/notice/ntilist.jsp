<%@page import="board.notice.ex.ntiDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>게시판</title>
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
	<jsp:include page="../header.jsp"></jsp:include>
	<br>
	<br>
	<div class="centered">
		<%
		String word = request.getParameter("word");		
		String col = request.getParameter("col");
		String pageNum = request.getParameter("key");
		
		System.out.println(pageNum);
		int pageNo;

		if (pageNum == null) {
		 pageNo = 1;
		} else {
		pageNo = Integer.parseInt(pageNum);
		}	  
		
		ntiDAO dao = new ntiDAO();
		
		String tc = (String)request.getAttribute("totalCount");
		int TotalCount = 0;
		
		if(tc!=null){
			TotalCount = Integer.parseInt(tc);
		}
		
		System.out.println(TotalCount);
		int No = TotalCount - (pageNo-1) * 10 ;

		int pageCount = TotalCount/10 + 1; 
		
		int pre;
		int next;
		
		if(pageNo > 1)
			pre = pageNo - 1;
		else
			pre = pageNo;
		
		if((pageNo+1)<=pageCount)
			next = pageNo + 1;
		else
			next = pageCount;
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		if (col == null && word == null)
		{
		%>

		<div class="shadow p-3 mb-5 bg-white rounded">
			<table border="1" rules="rows" width="750" cellpadding="0"
				cellspacing="0" class="table table-bordered">
				<tr>
					<td class="td_color text-center" width="50px"><b class="font">순번</b>
					</td>
					<td class="td_color text-center" width="500px"><b class="font">제목</b>
					</td>
					<td class="td_color text-center"><b class="font">작성자</b></td>
					<td class="td_color text-center"><b class="font">작성일자</b></td>
				</tr>
				<c:forEach var="l" items="${list}">
					<tr>
						<td class="font2"><%=No%></td>
						<td class="font2"><a href="ntiView.mjy?key=${l.count}">${l.title}</td>
						<td class="font2">${l.name}</td>
						<td class="font2">${l.date}</td>
						<% No = No - 1; %>
					</tr>
				</c:forEach>

				<%-- 				<%
					r_num = r_num - 1;
					}
				%> --%>
			</table>
			<div>
				<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link"
						href="../board2/ntiList.mjy?key=<%=pre%>">Previous</a></li>


					<c:forEach var="i" begin="${dto.startPage}" end="${dto.endPage}"
						step="1">
						<li class="page-item"><a class="page-link"
							href="../board2/ntiList.mjy?key=${i}">${i}</a></li>
					</c:forEach>

					<li class="page-item"><a class="page-link"
						href="../board2/ntiList.mjy?key=<%=next%>">Next</a></li>

				</ul>
				</nav>
			</div>
			<div align="right">
				<% 
					if(session.getAttribute("id").equals("admin")) {%>
				<a href="../board2/notice/input.jsp">
					<button type="button" class="btn btn-secondary btn-sm font2">글등록</button>
				</a>
				<%}%>
			</div>
		</div>

		<%}	else{ %>

		<div class="shadow p-3 mb-5 bg-white rounded">
			<table border="1" rules="rows" width="750" cellpadding="0"
				cellspacing="0" class="table table-bordered">
				<tr>
					<td class="td_color text-center" width="50px"><b class="font">순번</b>
					</td>
					<td class="td_color text-center" width="500px"><b class="font">제목</b>
					</td>
					<td class="td_color text-center"><b class="font">작성자</b></td>
					<td class="td_color text-center"><b class="font">작성일자</b></td>
				</tr>

				<c:forEach var="l" items="${list}">
					<tr>
						<td class="font2"><%=No%></td>
						<td class="font2"><a href="ntiView.mjy?key=${l.count}">${l.title}</td>
						<td class="font2">${l.name}</td>
						<td class="font2">${l.date}</td>
						<% No = No - 1; %>
					</tr>
				</c:forEach>

			</table>
			<div>
				<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link"
						href="../board2/ntiList.mjy?key=<%=pre%>">Previous</a></li>


					<c:forEach var="i" begin="${dto.startPage}" end="${dto.endPage}"
						step="1">
						<li class="page-item"><a class="page-link"
							href="../board2/ntiList.mjy?key=${i}">${i}</a></li>
					</c:forEach>

					<li class="page-item"><a class="page-link"
						href="../board2/ntiList.mjy?key=<%=next%>">Next</a></li>
				</ul>
				</nav>
			</div>
			<div align="right">
				<% 
					if(session.getAttribute("id").equals("admin")) {%>
				<a href="../board2/notice/input.jsp">
					<button type="button" class="btn btn-secondary btn-sm font2">글등록</button>
				</a>
				<%}%>
			</div>
		</div>

		<%} %>
		<DIV class='aside_menu'>
			<FORM name='frm' method='GET' action='../board2/ntiSearch.mjy?'>
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
	<jsp:include page="../footer.html" />
</body>
</html>