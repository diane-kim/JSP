<%@page import="board.member.MemberDTO"%>
<%@page import="board.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = new MemberDTO();
	
	dto = dao.getMember(id);
	
	int checkNum = dao.userCheck(dto);

	if(id.equals("admin") && pwd.equals("admin")){
		dto = dao.getMember(id);
		
		String name= dto.getName();
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		response.sendRedirect("../ntiList.mjy");
		
	}else{
		if(checkNum == -1) {
			%>
					<script language="javascript">
						alert("아이디가 존재하지 않습니다.");
						history.go(-1);
					</script>
			<%
				} else if(checkNum == 0) {
			%>
					<script language="javascript">
						alert("비밀번호가 틀렸습니다.");
						history.go(-1);
					</script>
			<%
				} else if(checkNum == 1) {
					MemberDTO dto2 = dao.getMember(id);
					
					if(dto2 == null) {
			%>
					<script language="javascript">
						alert("존재하지 않는 회원입니다.");
						history.go(-1);
					</script>
			<%
					} else {
						String name = dto2.getName();
						session.setAttribute("id", id);
						session.setAttribute("name", name);
						response.sendRedirect("../ntiList.mjy");
					}
				}	
			%>
	<%
	}
%>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>