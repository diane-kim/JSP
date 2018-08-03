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
window.location.replace('http://localhost/ex03/board/list.jsp')	//입력후 다시 돌아감.
</script>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		String user = "hr";
		String pw = "hr";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pw);

		String sql = "insert into board values(board_seq.nextval,?,?,?)";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, b.getName());
		pstmt.setString(2, b.getDate());
		pstmt.setString(3, b.getTitle());

		pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
<%-- <jsp:forward page="list.jsp"> --%>
</body>
</html>