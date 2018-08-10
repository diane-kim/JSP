package com.javalec.ex03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDAO {
	
	Connection conn = null;
	
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
	
	public void contentInsert(MemberDTO dto) {
		getConection();
		
		try {
	 		String sql = "insert into board values(?,?,?,?,member_SEQ.nextval)";	
	 		PreparedStatement pstmt = conn.prepareStatement(sql);	
	 		pstmt.setString(1, dto.getId());	
			pstmt.setString(2, dto.getPwd());	
			pstmt.setString(3, dto.getEmail());	
			pstmt.setString(4, dto.getPhone());
	 		pstmt.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
