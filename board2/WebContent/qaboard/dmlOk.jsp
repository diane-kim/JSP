<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- update,insert,delete문 새로고침으로 반복 방지 sendRedirect 사용 -->
	<%
	String Test =(String)request.getAttribute("test");
	int no;
	
	if(Test != null){
		if("qw".equals(Test)){
			response.sendRedirect("/board2/qaList.khy");
			
		}else if("qd".equals(Test)){
			no =Integer.parseInt(request.getParameter("qa_id"));
			response.sendRedirect("/board2/qaList.khy");
		}
		else if("rw".equals(Test) || "qm".equals(Test) || "rd".equals(Test)){
			no =Integer.parseInt(request.getParameter("qa_id"));
			response.sendRedirect("/board2/qaContent.khy?qa_id="+no);
		}
			
		else {
	%>
		<script language="javascript">
			alert("오류가 발생했습니다.");
			history.go(-1);
		</script>
			
	<% } } %>
</body>
</html>