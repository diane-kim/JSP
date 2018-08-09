<%@page import="board.file.FileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>
	<%!Connection conn = null;
	PreparedStatement pstmt = null;%>

	<%
		board.file.FileDAO dao = new board.file.FileDAO();
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
	<%
		FileDTO dto2 = null;
		
		dto2 = dao.fileCount();
		int totalCount = dto2.getCount();

		int page1;

		String count = request.getParameter("key");

		if (count == null) {
			page1 = 1;
		} else {
			page1 = Integer.parseInt(count);
		} //페이지 초기화

		int countPage = 8;

		int query_startPage = (page1 - 1) * countPage + 1; //쿼리문에 들어갈 시작값 
		int query_endPage = page1 * countPage; //쿼리문에 들어갈 앤드값 

		int r_num = totalCount - (page1 - 1) * countPage; //페이지 순번 역순으로 나오게 하기

		FileDTO dto = null;

		String sql = "select X.rnum, X.file_count, X.file_title, X.file_content, X.file_name from ("

				+ "select rownum as rnum, A.file_count, A.file_title, A.file_content, A.file_name"

				+ " from ("

				+ "select file_count, file_title, file_content, file_name"

				+ " from image"

				+ " order by file_count desc) A"

				+ " where rownum <= " + query_endPage + ") X"

				+ " where X.rnum >= " + query_startPage + "";
		List<FileDTO> list = new ArrayList<>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new FileDTO();
				dto.setCount(rs.getInt("file_count"));
				dto.setTitle(rs.getString("file_title"));
				dto.setContent(rs.getString("file_content"));
				dto.setFileName(rs.getString("file_name"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	<div class="container centered">
		<div class="row">
			<%
				for (board.file.FileDTO dto3 : list) {
			%>
			<div class="card" style="width: 15rem;">
				<a href="View.jsp?key=<%=dto3.getCount()%>"><img
					class="card-img-top" src="../image/<%=dto3.getFileName()%>"
					alt="Card image cap"></a>
				<div class="card-body">

					<h5 class="card-title"><%=dto3.getTitle()%></h5>
					<p class="card-text"><%=dto3.getContent()%></p>
				</div>
			</div>
			<%
				}
			%>

			<%
				//DB에서 count(*)로 가져와야함 13
				//System.out.print(totalCount);
				int countList = 8; //10개의 게시글 리스트 
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
		</div>
		<div>
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<%
						if (page1 >= 1) {
							page1 = 2;
					%> <a class="page-link" href="list.jsp?key=<%=(page1 - 1)%>">Previous</a>
				</li>
				<%
					}
				%>

				<%
					for (int iCount = startPage; iCount <= endPage; iCount++) { //1~10 11~20 .... 이부분에 html 와야함
				%>
				<li class="page-item"><a class="page-link"
					href="list.jsp?key=<%=iCount%>"><%=iCount%></a></li>
				<%
					}
				%>

				<%
					if (page1 <= totalPage) {
						page1 = totalPage - 1;
				%>
				<li class="page-item"><a class="page-link"
					href="list.jsp?key=<%=(page1 + 1)%>">Next</a></li>
				<%
					}
				%>
			</ul>
			</nav>
		</div>
		<div align="right">
			<a href="input.jsp">
				<button type="button" class="btn btn-outline-primary font2">사진업로드</button>
			</a>
		</div>
	</div>
</body>
</html>