<%@page import="com.javalec.ex03.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE>
<meta http-equiv="refresh" content="1;url=http://exampleURL.com">
<jsp:useBean id="b" class="com.javalec.ex03.BoardDTO" />
<%-- <jsp:setProperty name="b" property="*" /> --%>
<html>
<head>
<script type="text/javascript">
	window.location.replace('http://localhost/board2/board/list.jsp') //수정 후 다시 돌아감.
</script>
</head>
<body>
	 	<%
	 	
		String count = request.getParameter("key");
		b.setCount(Integer.parseInt(count));
		
		
	String path = application.getRealPath("updownFile");
	

	int size = 1024 * 1024 * 10; //10M
	String file = "";
	String oriFile = "";

	try{
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String str = (String)files.nextElement();
		
		file = multi.getFilesystemName(str);
		oriFile = multi.getOriginalFileName(str);
		
		b.setName(multi.getParameter("name"));
		b.setDate(multi.getParameter("date"));
		b.setTitle(multi.getParameter("title"));
		b.setContent(multi.getParameter("content"));
				
		BoardDAO boardDAO = new BoardDAO();

		boardDAO.contentUpdate(b);
		
	} catch (Exception e) {
		e.printStackTrace();
	}	
%> 
</body>
</html>