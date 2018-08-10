<%@page import="com.javalec.ex03.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE>
<meta http-equiv="refresh" content="1;url=http://exampleURL.com">
<jsp:useBean id="b" class="com.javalec.ex03.BoardDTO" />
<jsp:setProperty name="b" property="*" />
<html>
<head>
<script type="text/javascript">
	window.location.replace('http://localhost/board2/board/list.jsp') //입력후 다시 돌아감.
</script>
</head>
<body>
	<%
		String count = request.getParameter("key");
		b.setCount(Integer.parseInt(count));

		BoardDAO boardDAO = new BoardDAO();

		boardDAO.contentDelete(Integer.parseInt(count));
	%>
	<%-- <jsp:forward page="list.jsp"> --%>
</body>
</html>