package board.qna.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class qaDao {

	DataSource dataSource;
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	int rn = 0;
	int rn2 = 0; 

	public qaDao() {

		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	//QnA 목록 
	public ArrayList<qaDto> listQ() {

		ArrayList<qaDto> list = new ArrayList<qaDto>();
		
		qaDto dto = null;

		try {
			conn = dataSource.getConnection();

			String sql = "select qa_id, qa_name, qa_subject,qa_pwd, qa_date, qa_read, qa_replyCount from QnAboard";

			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();

			while(rs.next()) {
				
				dto = new qaDto();
				dto.setQa_id(rs.getInt("qa_id"));
				dto.setQa_name(rs.getString("qa_name"));
				dto.setQa_sub(rs.getString("qa_subject"));
				dto.setQa_pwd(rs.getString("qa_pwd"));
				dto.setQa_date(rs.getTimestamp("qa_date"));
				dto.setQa_read(rs.getInt("qa_read"));
				dto.setQa_count(rs.getInt("qa_replyCount"));

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
	
	//QnA 내용 보기 + 조회수 1 증가 
	public qaDto contentQ(int no) {
		qaDto dto = new qaDto();
		
		
		
		try {
			conn = dataSource.getConnection();
			String sql = "update QnAboard set qa_read = qa_read+1 where qa_id =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rn = pstmt.executeUpdate();
			
			String sql2 = "select qa_id, qa_name, qa_subject,qa_content, qa_pwd,qa_date, qa_read, qa_replyCount from QnAboard" 
						  +" where qa_id = ?";

			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, no);
			rs2= pstmt2.executeQuery();
			
			
			while(rs2.next()) {
				
				dto.setQa_id(rs2.getInt("qa_id"));
				dto.setQa_name(rs2.getString("qa_name"));
				dto.setQa_sub(rs2.getString("qa_subject"));
				dto.setQa_con(rs2.getString("qa_content"));
				dto.setQa_pwd(rs2.getString("qa_pwd"));
				dto.setQa_date(rs2.getTimestamp("qa_date"));
				dto.setQa_read(rs2.getInt("qa_read"));
				dto.setQa_count(rs2.getInt("qa_replyCount"));
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				if(rs2 != null) rs2.close();
				if(pstmt2 != null) pstmt2.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
		
				e2.printStackTrace();
			}
		}
		
		return dto;
		
		
		
	}
	
	//writeform 으로 QnAboard insert 
	public void writeQ(String name, String subject, String content, String pwd) {
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into QnAboard values(qna_board_sequence.nextval,?,?,?,sysdate,0,0,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, pwd);
			
			rn = pstmt.executeUpdate();
			
			if(rn == 1)
				System.out.println(rs + "개의 행이(가) QnAboard에 삽입되었습니다.");
			else
				System.out.println("실패");
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt2 != null) pstmt2.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
		
				e2.printStackTrace();
			}
		}
		
		
	}
	
	//삭제 시 비밀번호 체크 
	public int pwdCheck(int no, String pwd) {
		
		int CheckNum = 0;
		String qaPw;
		
		
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select qa_pwd from QnAboard where qa_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				qaPw = rs.getString("qa_pwd");
				if(qaPw.equals(pwd)) {
					CheckNum = 1;		
				} else {
					CheckNum = 0;		
				}
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return CheckNum;
	}
	
	//QnA 삭제 
	public void deleteQ(int no) {
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "delete from QnAboard where qa_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rn = pstmt.executeUpdate();
			
			String sql2 = "delete from ReplyBoard where qa_id = ?";
			
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, no);
			rn2 = pstmt.executeUpdate();
			
			if(rn == 1)
				System.out.println(rn + "개의 행이(가) QnAboard로부터 삭제되었습니다.");
			else
				System.out.println("실패");
			
			if(rn2 > 0)
				System.out.println(rn2 + "개의 행이(가) ReplyBoard로부터 삭제되었습니다.");
			else
				System.out.println("실패");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				if(pstmt2 != null) pstmt2.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
		
				e2.printStackTrace();
			}
		}
		
		
	}
	
	//QnA 내용 수정 
	public void modifyQ(int id, String sub, String cont) {
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "update QnAboard set qa_subject = ?, qa_content = ?,qa_date = sysdate"
						+",qa_read = 0 where qa_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sub);
			pstmt.setString(2, cont);
			pstmt.setInt(3, id);
			
			rn = pstmt.executeUpdate();
			
			if(rn == 1)
				System.out.println(rn + "개의 행이(가) 수정되었습니다.");
			else
				System.out.println("실패");
			
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
		
	}






}