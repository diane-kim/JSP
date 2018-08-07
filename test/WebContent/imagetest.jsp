<%-- <%@page import="com.javalec.ex03.BoardDAO"%> --%>
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
<!-- <meta http-equiv="refresh" content="1;url=http://exampleURL.com"> -->
<%-- <jsp:useBean id="b" class="com.javalec.ex03.BoardDTO" /> --%>
<%-- <jsp:setProperty name="b" property="*" /> --%>
<html>
<head>
<!-- <script type="text/javascript">
	window.location.replace('http://localhost/board/board/list.jsp') //입력후 다시 돌아감.
</script> -->
</head>
<body>

	<blockquote class="blockquote text-right">
		<footer class="blockquote-footer">
			Someone famous in <cite title="Source Title">Source Title</cite>
		</footer>
	</blockquote>
	<%
	String path = application.getRealPath("updownFile");
	

	int size = 1024 * 1024 * 10; //10M
	String file = "";
	String oriFile = "";
	
	String relativeDirectory = "";
	
	ServletContext context = getServletContext();
	
	String realDirectory = context.getRealPath(relativeDirectory);

		MultipartRequest multi = new MultipartRequest(request, realDirectory, size, "UTF-8", new DefaultFileRenamePolicy());
		
		String my_image = multi.getOriginalFileName("FileName");
		
		Enumeration files = multi.getFileNames();

		 String filesName = (String)files.nextElement();

			out.print(my_image); //파일명 이걸 디비에 가져가서 경로를 지정


		

%>
	<img width="30%" src="contents\member_uploaded\<%=my_image%>">
</body>
</html>