<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="b" class="com.jyMoon.ex.Board" />
<jsp:setProperty name="b" property="*" />
<jsp:setProperty name="b" property="password" value="<%=b.getId()%>" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<th>���̵�</th>
			<td><jsp:getProperty name="b" property="id" /></td>
		</tr>
		<tr>
			<th>��й�ȣ</th>
			<td><jsp:getProperty name="b" property="password" /></td>
		</tr>
		<tr>
			<th>����</th>
			<td><jsp:getProperty name="b" property="title" /></td>
		</tr>
		<tr>
			<th>����</th>
			<td><jsp:getProperty name="b" property="content" /></td>
		</tr>
	</table>
</body>
</html>