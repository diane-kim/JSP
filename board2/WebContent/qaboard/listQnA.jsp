<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "board.qna.ex.qaDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
a { color:grey;}
/* div {
	position: absolute;
	width: 1000px;
	height: 500px;
	left: 50%;
	top: 50%;
	margin: -250px 0 0 -500px;
} */
tr.b { border-bottom: 1px solid lightgrey; }
.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>
<title>Insert title here</title>
</head>
<body style="text-align: center">
<jsp:include page="../header.jsp"></jsp:include>
<% 
	String pageNum = (String)request.getParameter("pageNum");
	System.out.println(pageNum);
	int pageNo;

	if (pageNum == null) {
	 pageNo = 1;
	} else {
	pageNo = Integer.parseInt(pageNum);
	}	  
	
	qaDao dao = new qaDao();
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
	
	
%>
	<br />
	<h3>Q & A</h3>
	<div class="centered">
		<table style="width: 1000px; text-align: center;">
		<tr style="color:grey; height: 50px" class="b">
				<td style="width: 150px">No</td>
				<td>Subject</td>
				<td style="width: 150px">Date</td>
				<td style="width: 150px">Name</td>
				<td style="width: 100px">Read</td>
			</tr>
			<c:forEach var="l" items="${list}">
				<tr class="b">
					<td style="width: 150px"><%=No%></td>
					<td>
					<a href="/board2/qaContent.khy?qa_id=${l.qa_id}&check=true">${l.qa_sub}&nbsp;&nbsp;</a> 
					<c:if test="${l.qa_count>0}">
					[답변 <p style="color: blue; display: inline; vertical-align:bottom">${l.qa_count}</p>]
					</c:if>
					<c:if test="${l.qa_read>100}">
							<p style="color: red; display: inline; vertical-align: bottom">hot</p>
					</c:if>
					</td>
					<td style="width: 150px">${l.qa_date}</td>
					<td style="width: 150px">${l.qa_name}</td>
					<td style="width: 100px">${l.qa_read}</td>
					<% No = No - 1; %>
				</tr>
			</c:forEach>
			<c:if test="${id != null}"> <!-- id가 없으면 write 안뜸 --> 
			<tr style="height: 50px; text-align: right; margin: -20px;">
				<td colspan="5">
					<p style="padding: 2px 25px 3px 25px; border: 1px solid lightgrey; display: inline;">
						<a href="qaboard/writeQnA.jsp">WRITE</a>
					</p>
				</td>
			</tr>
			</c:if>
			<tr style="height: 30px;">
				<td colspan="4">
				<a href="/board2/qaList.khy?pageNum=<%=pre%>">◀ </a>
				<%for (int i = 1; i<=pageCount;i++){ %>
				<a href="/board2/qaList.khy?pageNum=<%=i%>">&nbsp;<%= i %>&nbsp;</a>
				<% } %>
				<a href="/board2/qaList.khy?pageNum=<%=next%>">▶</a>
				</td>				
			</tr>
			
			<tr style="height: 50px">
				<td colspan="5" style="text-align: left">
					<form action="/board2/searchQnA.khy">
						&nbsp;&nbsp; <input type="text" name="search"><input
							type="submit" value="search" placeholder="검색하실 subject을 입력하세요.">
					</form>
			</tr>
		</table>
</div>	
<jsp:include page="../footer.html"/>
</body>
</html>