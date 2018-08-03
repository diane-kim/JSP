<%@ page language="java" contentType="text/html; charset=UTF-8"	
	pageEncoding="UTF-8"%>	
<%	
	request.setCharacterEncoding("UTF-8");	
%>	
<%@ page language="java" import="java.sql.*"%>	
<%@ page language="java" import="java.util.*"%>	
 <jsp:useBean id="b" class="com.javalec.ex03.BoardDTO" />	
<jsp:setProperty name="b" property="*" />	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>	
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<link rel="stylesheet"	
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"	
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"	
	crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Gaegu|Rancho"	
	rel="stylesheet">	
<style>	
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);	
.font2 {	
	font-family: 'Gaegu', cursive;	
	font-size: 20px;	
}	
.font {	
	font-family: 'Nanum Pen Script', cursive;	
	font-size: 20px;	
}	
 td, th {	
	border: 0.2px solid gray;	
	margin: 10px;	
	padding: 10px;	
}	
 .td_color {	
	background-color: #EAEAEA;	
	font-size: 13px;	
}	
 .centered {	
	display: table;	
	margin-left: auto;	
	margin-right: auto;	
}	
</style>	
</head>	
<body>	
<%!Connection conn = null;	
	PreparedStatement pstmt = null;%>	
	<%	
			
		try {	
			String user = "hr";	
			String pw = "hr";	
			String url = "jdbc:oracle:thin:@localhost:1521:xe";	
 			Class.forName("oracle.jdbc.driver.OracleDriver");	
			conn = DriverManager.getConnection(url, user, pw);	
 		} catch (SQLException e) {	
			// TODO Auto-generated catch block	
			e.printStackTrace();	
		}	
	%>	
	<br>	
	<br>	
	<div class="centered">	
		<div class="shadow p-3 mb-5 bg-white rounded">	
			<table border="1" rules="rows" width="750" cellpadding="0"	
				cellspacing="0" class="table table-bordered">	
				<tr>	
					<td class="td_color text-center" width="50px"><b class="font">순번</b>	
					</td>	
					<td class="td_color text-center" width="500px"><b class="font">제목</b>	
					</td>	
					<td class="td_color text-center"><b class="font">작성자</b></td>	
					<td class="td_color text-center"><b class="font">작성일자</b></td>	
				</tr>	
 				<%			
					
				com.javalec.ex03.BoardDTO dto = null;	
				String sql = "select i_Count, v_Name, to_char(d_Date, 'yy-mm-dd') as d_Date, v_Title from board order by i_Count desc";	
					
				List<com.javalec.ex03.BoardDTO> list = new ArrayList<>();				
					
					
					
				try {	
					PreparedStatement pstmt = conn.prepareStatement(sql);	
					ResultSet rs = pstmt.executeQuery();	
 					while(rs.next()) {	
						dto = new com.javalec.ex03.BoardDTO();					
						dto.setCount(rs.getInt("i_Count"));	
						dto.setName(rs.getString("v_Name"));	
						dto.setDate(rs.getString("d_Date"));	
						dto.setTitle(rs.getString("v_Title"));	
 						list.add(dto);	
					}        			
				}catch(SQLException e) {	
					e.printStackTrace();	
				}		
					
					
					
				for(com.javalec.ex03.BoardDTO dto1 : list) {	
				%>	
				<tr>	
					<td class="font2"><%=dto1.getCount()  %></td>	
					<td class="font2"><%=dto1.getTitle()  %></td>	
					<td class="font2"><%=dto1.getName()  %></td>	
					<td class="font2"><%=dto1.getDate()  %></td>	
				</tr>	
				<%	
				}  	
				%>	
			</table>	
		</div>	
	</div>	
</body>	
</html> 