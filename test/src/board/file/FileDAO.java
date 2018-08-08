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
	
	public List<FileDTO> fileList() {
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
	}
	
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
		
		String sql = "select count(*) as count from board";
		
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
}
