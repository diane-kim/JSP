<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<h2>입력 결과</h2>
<%
	int val = Integer.parseInt(request.getParameter("val"));
	String result = "";

	if (val >= 10) {
		result = "10보다 크거나 같은 값";
	} else {
		result = "10보다 작은 값";
	}
%>
<dl>
	<dd>
		입력값에 대한 결과:<%=result%></dd>
</dl>


