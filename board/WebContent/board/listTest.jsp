<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.*"%>
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
					String sql2 = "select count(*) as count from board";
					com.javalec.ex03.BoardDTO dto2 = new com.javalec.ex03.BoardDTO();

					try {
						PreparedStatement pstmt = conn.prepareStatement(sql2);
						ResultSet rs = pstmt.executeQuery();
						rs.next();
						dto2.setTotalCount(rs.getInt("count"));

					} catch (SQLException e) {
						e.printStackTrace();
					}

					int totalCount = dto2.getTotalCount();

					int page1;

					String count = request.getParameter("key");

					if (count == null) {
						page1 = 1;
					} else {
						page1 = Integer.parseInt(count);
					}
					int countPage = 10;

					int query_startPage = (page1 - 1) * countPage + 1; //쿼리문에 들어갈 시작값 
					int query_endPage = page1 * countPage; //쿼리문에 들어갈 앤드값 

					int r_num = totalCount - (page1 - 1) * countPage; //페이지 순번 역순으로 나오게 하기

					/* System.out.println();
										for(int i = r_num ; i > r_num-10 ; i--){
											if(i < 1)break;
											System.out.println(" "+ i+ " ");
										}  */

					com.javalec.ex03.BoardDTO dto = null;

					String sql = "select X.rnum, X.i_Count, X.v_Name, X.v_Title, to_char(X.d_Date) as d_Date " + "from (" +

							"select rownum as rnum, A.i_Count, A.v_Name, A.v_Title, A.d_Date " +

							"from ("

							+ "select i_Count, v_Name, v_Title, d_Date "

							+ "from board " +

							"order by i_Count desc) A " +

							"where rownum <= " + query_endPage + ") X "

							+ "where X.rnum >= " + query_startPage + "";

					List<com.javalec.ex03.BoardDTO> list = new ArrayList<>();

					try {
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						while (rs.next()) {
							dto = new com.javalec.ex03.BoardDTO();
							dto.setCount(rs.getInt("i_Count"));
							dto.setName(rs.getString("v_Name"));
							dto.setDate(rs.getString("d_Date"));
							dto.setTitle(rs.getString("v_Title"));
							list.add(dto);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}

					for (com.javalec.ex03.BoardDTO dto1 : list) {
				%>
				<tr>
					<td class="font2">
						<%
							out.print(r_num);
						%>
					</td>
					<td class="font2"><a href="View.jsp?key=<%=dto1.getCount()%>"><%=dto1.getTitle()%></a></td>
					<td class="font2"><%=dto1.getName()%></td>
					<td class="font2"><%=dto1.getDate()%></td>
				</tr>
				<%
					r_num = r_num - 1;
					}
				%>

			</table>
			<%
				//DB에서 count(*)로 가져와야함 13
				//System.out.print(totalCount);
				int countList = 10; //10개의 게시글 리스트 
				int totalPage = totalCount / countList; // 총 페이지의 수	 13/10 1 

				int startPage = ((page1 - 1) / 10) * 10 + 1; // 스타트 지점 1~10 은 모두 1, 11~20은 모두 11 스타트 지점 1
				int endPage = startPage + countPage - 1; // 끝나는 지점 1~10 은 모두 10, 11~20은 모두 20 끝나는 지점 1+10-1 10

				if (totalCount % countList > 0) {
					totalPage++;
				} //totalCount의 자투리 부분 페이징 +1 추가 처리 13%10 나머지 3 토탈 페이지 2개로 증가				
				if (endPage > totalPage) {
					endPage = totalPage;
				} //10 > 2 끝나는 페이지가 전체 페이지 보다 클떄 처리 엔드페이지 2
			%>

			<div>
				<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<%
							if (page1 >= 1) {
								page1 = 2;
						%> <a class="page-link" href="listTest.jsp?key=<%=(page1 - 1)%>">Previous</a>
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
							page1 = totalPage - 1;
					%>
					<li class="page-item"><a class="page-link"
						href="listTest.jsp?key=<%=(page1 + 1)%>">Next</a></li>
					<%
						}
					%>
				</ul>
				</nav>
				<div align="right">
					<a href="inputboard.jsp">
						<button type="button" class="btn btn-outline-primary font2">글쓰기</button>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
