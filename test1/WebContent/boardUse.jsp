<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="b" scope="request" class="com.jyMoon.ex.Board"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	���̵� : <%=b.getId()%> <br> 
	 ��й�ȣ : <%=b.getPassword()%><br>
	 ���� :<%=b.getTitle()%><br>
	���� :<%=b.getContent()%><br>

</body>
</html>