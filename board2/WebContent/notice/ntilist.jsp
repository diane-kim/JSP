<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<br>
	<br>
	<%
		String word = request.getParameter("word");		
		String col = request.getParameter("col");
		String key = request.getParameter("key");
		out.print(col + "," + word);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		if (col == null && word == null)
		{
		%>
	<div class="centered">
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
						<%-- 					<td class="font2">
						<%
							out.print(r_num);
						%>
					</td> --%>
						<td class="font2">${l.count}</td>
						<td class="font2"><a href="ntiView.mjy?key=${l.count}">${l.title}</td>
						<td class="font2">${l.name}</td>
						<td class="font2">${l.date}</td>
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
					<li class="page-item">
					
					<c:if test="${dto.page1 >= 1}">
					<%-- ${dto.page1 = 2}	 --%>				
					<a class="page-link" href="../board2/ntiList.mjy?key=${dto.page1 - 1}">Previous</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${dto.startPage}" end="${dto.endPage}"
						step="1">
						<li class="page-item"><a class="page-link"
							href="../board2/ntiList.mjy?key=${i}">${i}</a></li>
					</c:forEach>

					<c:if test="${dto.page1 <= dto.totalPage}">
				<%-- ${dto.page1 = dto.totalPage-1} --%>			
				<li class="page-item"><a class="page-link"
							href="../board2/ntiList.mjy?key=${dto.page1+1}">Next</a></li>
					</c:if>
				</ul>
				</nav>
			</div>
		</div>
	</div>
	<%}	else{ %>
		<div class="centered">
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
						<%-- 					<td class="font2">
						<%
							out.print(r_num);
						%>
					</td> --%>
						<td class="font2">${l.count}</td>
						<td class="font2"><a href="ntiView.mjy?key=${l.count}">${l.title}</td>
						<td class="font2">${l.name}</td>
						<td class="font2">${l.date}</td>
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
					<li class="page-item">
					
					<c:if test="${dto.page1 >= 1}">
					<%-- ${dto.page1 = 2}	 --%>				
					<a class="page-link" href="../board2/ntiList.mjy?key=${dto.page1 - 1}">Previous</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${dto.startPage}" end="${dto.endPage}"
						step="1">
						<li class="page-item"><a class="page-link"
							href="../board2/ntiList.mjy?key=${i}">${i}</a></li>
					</c:forEach>

					<c:if test="${dto.page1 <= dto.totalPage}">
				<%-- ${dto.page1 = dto.totalPage-1} --%>			
				<li class="page-item"><a class="page-link"
							href="../board2/ntiList.mjy?key=${dto.page1+1}">Next</a></li>
					</c:if>
				</ul>
				</nav>
			</div>
		</div>
	</div>

	<%} %>
					<DIV class='aside_menu'>
		  <FORM name='frm' method='GET' action='../board2/ntiSearch.mjy'>
		    <ASIDE style='float: right;'>
		      <SELECT name='col'> <!-- 검색 컬럼 -->
		        <OPTION value='none'>전체 목록</OPTION>
		        <OPTION value='content'>내용</OPTION>
		      </SELECT>
		      <input type='text' name='word' size ='20' value=''>
		      <button type='submit'>검색</button>
		    </ASIDE> 
		  </FORM>
		  <DIV class='menu_line' style='clear: both;'></DIV>
		</DIV>
</body>
</html>