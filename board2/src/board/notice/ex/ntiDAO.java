package board.notice.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.file.FileDTO;

public class ntiDAO {

	DataSource dataSource;

	public ntiDAO() {

		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	public List<ntiDTO> ntilist(String count) {

		List<ntiDTO> list = new ArrayList<ntiDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ntiDTO dto = null;

		try {
			conn = dataSource.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String sql2 = "select count(*) as count from board";

		dto = new ntiDTO();

		try {
			pstmt = conn.prepareStatement(sql2);
			rs= pstmt.executeQuery();
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

		int countPage = 10;

		int query_startPage = (page1 - 1) * countPage + 1; //쿼리문에 들어갈 시작값 
		int query_endPage = page1 * countPage; //쿼리문에 들어갈 앤드값 

		int r_num = totalCount - (page1 - 1) * countPage; //페이지 순번 역순으로 나오게 하기


		try {

			String sql = "select X.rnum, X.i_Count, X.v_Name, X.v_Title, to_char(X.d_Date) as d_Date " + "from (" +

							"select rownum as rnum, A.i_Count, A.v_Name, A.v_Title, A.d_Date " +

							"from ("

							+ "select i_Count, v_Name, v_Title, d_Date "

							+ "from board " +

							"order by i_Count desc) A " +

							"where rownum <= " + query_endPage + ") X "

							+ "where X.rnum >= " + query_startPage + "";

			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();

			while(rs.next()) {
				while (rs.next()) {
					dto = new ntiDTO();
					dto.setCount(rs.getInt("i_Count"));
					dto.setName(rs.getString("v_Name"));
					dto.setDate(rs.getString("d_Date"));
					dto.setTitle(rs.getString("v_Title"));
					list.add(dto);
				}
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		return list;
	}
	
	public ntiDTO contentView(int cast) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ntiDTO dto = null;

		try {
			conn = dataSource.getConnection();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}			

		try {	
			String sql = "select i_count,v_name,to_char(d_date) as d_date,v_title,v_content from board where i_count = "+ cast;

			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();	
			
				while(rs.next()) {	
				dto = new ntiDTO();					
				dto.setCount(rs.getInt("i_Count"));	
				dto.setName(rs.getString("v_Name"));	
				dto.setDate(rs.getString("d_Date"));	
				dto.setTitle(rs.getString("v_Title"));	
				dto.setContent(rs.getString("v_content"));
			}        			
		}catch(SQLException e) {	
			e.printStackTrace();	
		}		
		return dto;
	}

}
