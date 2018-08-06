package com.javalec.ex03;

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

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;



public class BoardDAO extends HttpServlet{
	
	private DataSource dataSource;
	
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
	
	private void contentView() {
		
	}
	
	public void contentInsert(BoardDTO dto) {
		getConection();
		
		try {
	 		String sql = "insert into board values(board_seq.nextval,?,?,?,?)";	
	 		PreparedStatement pstmt = conn.prepareStatement(sql);	
	 		pstmt.setString(1, dto.getName());	
			pstmt.setString(2, dto.getDate());	
			pstmt.setString(3, dto.getTitle());	
			pstmt.setString(4, dto.getContent());
	 		pstmt.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	public void contentUpdate(BoardDTO dto) {
		getConection();
		
		try {
	 		String sql = "update board set v_name = ?, d_date = ?, v_title = ?, v_content = ? where i_count = "+ dto.count;	
	 		PreparedStatement pstmt = conn.prepareStatement(sql);	
	 		pstmt.setString(1, dto.getName());	
			pstmt.setString(2, dto.getDate());	
			pstmt.setString(3, dto.getTitle());	
			pstmt.setString(4, dto.getContent());
	 		pstmt.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}
	private void contentDelete() {
		
	}
}
