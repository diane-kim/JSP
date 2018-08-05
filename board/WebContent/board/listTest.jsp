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
					<td class="font2"><a href="View.jsp?key=<%=dto1.getCount()%>"><%=dto1.getTitle()%></a></td>
					<td class="font2"><%=dto1.getName()  %></td>
					<td class="font2"><%=dto1.getDate()  %></td>
				</tr>
				<%	
				}  	
				%>

			</table>
			<%
				int page1;
			
				String count = request.getParameter("key"); //내가 초이스 한 페이지
				if(count == null){page1 = 1;}else{page1 = Integer.parseInt(count);}
				
				int totalCount = 255;	//DB에서 count(*)로 가져와야함
				int countList = 10; 	//10개의 게시글 리스트 
				int totalPage = totalCount / countList;	// 총 페이지의 수		
					
				int countPage = 10; //1~10 ,11~20, 이런식으로 버튼 생성하려함

				int startPage = ((page1 - 1) / 10) * 10 + 1; // 스타트 지점 1~10 은 모두 1, 11~20은 모두 11
				int endPage = startPage + countPage - 1;	// 끝나는 지점 1~10 은 모두 10, 11~20은 모두 20
				
				if (totalCount % countList > 0) {totalPage++;}//totalCount의 자투리 부분 페이징 +1 추가 처리				
				if (endPage > totalPage) {endPage = totalPage;}//끝나는 페이지가 전체 페이지 보다 클떄 처리				
			%>

			<div>
				<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<%
							if (page1 >= 1) {
						%> <a class="page-link"
						href="listTest.jsp?key=<%=(page1 - 1)%>">Previous</a>
					</li>
					<%
						}
					%>
					
					<%
						for (int iCount = startPage; iCount <= endPage; iCount++) { //1~10 11~20 .... 이부분에 html 와야함
					%>
					<li class="page-item"><a class="page-link"
						href="listTest.jsp?key=<%=iCount%>"><%=iCount%></a></li>
					<%
						}
					%>
					
					<%
						if (page1 <= totalPage) {
					%>
					<li class="page-item"><a class="page-link"
						href="listTest.jsp?key=<%=(page1 + 1)%>">Next</a></li>
					<%
						}
					%>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>
