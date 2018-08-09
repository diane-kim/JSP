package board.file;

import java.awt.Transparency;
import java.io.File;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

public class FileDAO {
	
	Connection conn = null;
	FileDTO dto = null;

	public Connection getConection() {		

		try {
			String user = "hr"; 
			String pw = "hr";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";

			Class.forName("oracle.jdbc.driver.OracleDriver");        
			conn = DriverManager.getConnection(url, user, pw);

		} catch (ClassNotFoundException cnfe) {
			System.out.println("DB 드라이버 로딩 실패 :"+cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속실패 : "+sqle.toString());
		} catch (Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}	    	    
		return conn;
	}
	
	public void fileInsert(FileDTO dto) {
		getConection();
		
		try {
	 		String sql = "insert into image values(image_seq.nextval,?,?,?,?)";	
	 		PreparedStatement pstmt = conn.prepareStatement(sql);	
	 		pstmt.setString(1, dto.getFilePath());	
			pstmt.setString(2, dto.getFileName());	
			pstmt.setString(3, dto.getTitle());	
			pstmt.setString(4, dto.getContent());	
	 		pstmt.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
/*	public List<FileDTO> fileList() {
		getConection();
		
		String sql = "select file_name, file_title, file_content from image";
		
		List<FileDTO> list = new ArrayList<>();

		try {	
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			ResultSet rs = pstmt.executeQuery();	
				while(rs.next()) {	
				dto = new FileDTO();					
				dto.setFileName(rs.getString("file_name"));	
				dto.setTitle(rs.getString("file_title"));	
				dto.setContent(rs.getString("file_content"));	
				list.add(dto);
			}        			
		}catch(SQLException e) {	
			e.printStackTrace();	
		}
		return list;		
	}*/
	
	public FileDTO contentView(int cast) {
		getConection();					
		
		String sql = "select file_name, file_title, file_content from image where file_count = "+ cast;
		
		try {	
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			ResultSet rs = pstmt.executeQuery();	
				while(rs.next()) {	
				dto = new FileDTO();
				dto.setFileName(rs.getString("file_name"));
				dto.setContent(rs.getString("file_content"));
				dto.setTitle(rs.getString("file_title"));
			}        			
		}catch(SQLException e) {	
			e.printStackTrace();	
		}
		
		return dto;
	}
	
	public void fileUpdate(FileDTO dto) {
		getConection();
		
		try {
	 		String sql = "update image set file_name = ?, file_path = ?, file_title = ?, file_content = ? where file_count = "+ dto.count;	
	 		PreparedStatement pstmt = conn.prepareStatement(sql);	
	 		pstmt.setString(1, dto.getFileName());	
			pstmt.setString(2, dto.getFilePath());	
			pstmt.setString(3, dto.getTitle());	
			pstmt.setString(4, dto.getContent());
	 		pstmt.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}
	
	public void fileDelete(int cast) {
		getConection();
		
		String sql = "delete from image where file_count = " + cast;
		
		try {	
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			       			
		}catch(SQLException e) {	
			e.printStackTrace();	
		}		
	}
	
	public FileDTO fileCount() {
		getConection();
		
		String sql = "select count(*) as count from image";
		
		dto = new FileDTO();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			dto.setCount(rs.getInt("count"));

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<FileDTO> fileList(String count){
		
		getConection();
		
		String sql2 = "select count(*) as count from image";
		
		dto = new FileDTO();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			dto.setCount(rs.getInt("count"));

		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		int totalCount = dto.getCount();

		int page1;
		
		if (count == null) {
			page1 = 1;
		} else {
			page1 = Integer.parseInt(count);
		} //페이지 초기화

		int countPage = 8;

		int query_startPage = (page1 - 1) * countPage + 1; //쿼리문에 들어갈 시작값 
		int query_endPage = page1 * countPage; //쿼리문에 들어갈 앤드값 

		int r_num = totalCount - (page1 - 1) * countPage; //페이지 순번 역순으로 나오게 하기
		
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
				dto =new FileDTO();
				dto.setCount(rs.getInt("file_count"));
				dto.setTitle(rs.getString("file_title"));
				dto.setContent(rs.getString("file_content"));
				dto.setFileName(rs.getString("file_name"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public FileNextListDTO fileNextList(String count){
		getConection();
		
		String sql2 = "select count(*) as count from image";
		
		dto = new FileDTO();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			dto.setCount(rs.getInt("count"));

		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		int page1;
		
		if (count == null) {
			page1 = 1;
		} else {
			page1 = Integer.parseInt(count);
		} //페이지 초기화

		int countPage = 10;
		int countList = 8; //10개의 게시글 리스트 
		int totalPage = dto.getCount() / countList; // 총 페이지의 수	 13/10 1 

		int startPage = ((page1 - 1) / 10) * 10 + 1; // 스타트 지점 1~10 은 모두 1, 11~20은 모두 11 스타트 지점 1
		int endPage = startPage + countPage - 1; // 끝나는 지점 1~10 은 모두 10, 11~20은 모두 20 끝나는 지점 1+10-1 10

		if (dto.getCount() % countList > 0) {
			totalPage++;
		} //totalCount의 자투리 부분 페이징 +1 추가 처리 13%10 나머지 3 토탈 페이지 2개로 증가				
		if (endPage > totalPage) {
			endPage = totalPage;
		} //10 > 2 끝나는 페이지가 전체 페이지 보다 클떄
		
		FileNextListDTO fnldto = new FileNextListDTO();
		
		fnldto.setStartPage(startPage);
		fnldto.setEndPage(endPage);
		fnldto.setPage1(page1);
		fnldto.setTotalPage(totalPage);
		
		return fnldto;
		
	}
	
	public FileNextListDTO fileNextListTwo(String count,int listsize){
		getConection();
					
		int page1;
		
		if (count == null) {
			page1 = 1;
		} else {
			page1 = Integer.parseInt(count);
		} //페이지 초기화

		int countPage = 10;
		int countList = 8; //10개의 게시글 리스트 
		int totalPage = listsize / countList; // 총 페이지의 수	 13/10 1 

		int startPage = ((page1 - 1) / 10) * 10 + 1; // 스타트 지점 1~10 은 모두 1, 11~20은 모두 11 스타트 지점 1
		int endPage = startPage + countPage - 1; // 끝나는 지점 1~10 은 모두 10, 11~20은 모두 20 끝나는 지점 1+10-1 10

		if (listsize % countList > 0) {
			totalPage++;
		} //totalCount의 자투리 부분 페이징 +1 추가 처리 13%10 나머지 3 토탈 페이지 2개로 증가				
		if (endPage > totalPage) {
			endPage = totalPage;
		} //10 > 2 끝나는 페이지가 전체 페이지 보다 클떄
		
		FileNextListDTO fnldto = new FileNextListDTO();
		
		fnldto.setStartPage(startPage);
		fnldto.setEndPage(endPage);
		fnldto.setPage1(page1);
		fnldto.setTotalPage(totalPage);
		
		return fnldto;		
	}
	
	public List<FileDTO> fileSearchList(String count,String content){
		getConection();
		
		String sql2 = "select count(*) as count from image";
		
		dto = new FileDTO();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			dto.setCount(rs.getInt("count"));

		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		int totalCount = dto.getCount();

		int page1;
		
		if (count == null) {
			page1 = 1;
		} else {
			page1 = Integer.parseInt(count);
		} //페이지 초기화

		int countPage = 8;

		int query_startPage = (page1 - 1) * countPage + 1; //쿼리문에 들어갈 시작값 
		int query_endPage = page1 * countPage; //쿼리문에 들어갈 앤드값 

		int r_num = totalCount - (page1 - 1) * countPage; //페이지 순번 역순으로 나오게 하기
		
		String sql = "select X.rnum, X.file_count, X.file_title, X.file_content, X.file_name from ("

				+ "select rownum as rnum, A.file_count, A.file_title, A.file_content, A.file_name"

				+ " from ("

				+ "select file_count, file_title, file_content, file_name"

				+ " from image"
				
				+ " where file_title LIKE '%" + content + "%'"

				+ " order by file_count desc) A"

				+ " where rownum <= " + query_endPage + ") X"

				+ " where X.rnum >= " + query_startPage + "";
		
		List<FileDTO> list = new ArrayList<>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				dto =new FileDTO();
				dto.setCount(rs.getInt("file_count"));
				dto.setTitle(rs.getString("file_title"));
				dto.setContent(rs.getString("file_content"));
				dto.setFileName(rs.getString("file_name"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
