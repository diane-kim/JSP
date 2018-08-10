<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.qna.ex.qaDao"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>				
	<% 
	request.setCharacterEncoding("UTF-8");
	
	int qa_id = Integer.parseInt(request.getParameter("qa_id"));
	String pwd = request.getParameter("delPwd");
	String id = (String)session.getAttribute("id");
	
	System.out.println(id);

	
	qaDao dao = new qaDao();
	int CheckNum = dao.pwdCheck(qa_id,pwd);
	
	if(("admin").equals(id)){
		response.sendRedirect("/board2/qaDelete.khy?qa_id=" + qa_id);}
	else {
		if(pwd == ""){
	%>
		<script language="javascript">
					alert("수정&삭제하려면 비밀번호를 입력하세요.");
					history.go(-1);
		</script>
	<%	}else{
		if(CheckNum == 0) {
	%>
				<script language="javascript">
					alert("비밀번호가 틀립니다.");
					history.go(-1);
				</script>
	<%
		} else {
			
				response.sendRedirect("/board2/modifyQnA.khy?qa_id=" + qa_id);
			
		}}}
		%>
	
</body>
</html>