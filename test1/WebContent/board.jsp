<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="b" scope="request" class="com.jyMoon.ex.Board"/>
<% 
b.setId("gz"); 
b.setPassword("1234"); 
b.setTitle("제목"); 
b.setContent("내용"); 
%>
<jsp:forward page="boardUse.jsp" />
