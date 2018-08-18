package board.qna.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class rDao {
	
	DataSource dataSource;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	int rn = 0;
	int rn2 = 0;
	ResultSet rs = null;
	
	public rDao() {

		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	//답글 목록보기 
	public ArrayList<rDto> listR(int qId) {

		ArrayList<rDto> list = new ArrayList<rDto>();
		
		rDto dto = null;

		try {
			conn = dataSource.getConnection();

			String sql = "select re_id, re_name, re_content, to_char(re_date,'yyyy-MM-dd HH:mm') re_date , re_group,re_step, re_indent,qa_id from ReplyBoard "
						+ "where qa_id = ? order by re_id"; 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qId);
			rs= pstmt.executeQuery();

			while(rs.next()) {
				
				dto = new rDto();
				
				dto.setRe_id(rs.getInt("re_id"));
				dto.setRe_name(rs.getString("re_name"));
				dto.setRe_con(rs.getString("re_content"));
				dto.setRe_date(rs.getString("re_date"));
				dto.setRe_group(rs.getInt("re_group"));
				dto.setRe_indent(rs.getInt("re_indent"));
				dto.setQa_id(rs.getInt("qa_id"));
				
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
	
	//답글 작성 (현재 코드는 admin만 작성 가능), 추후 답글에 답글 작성 위해 코드 추가 
	public void writeR(int no, String content) {
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "update QnAboard set qa_replyCount = qa_replyCount+1 where qa_id =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rn = pstmt.executeUpdate();
			
			String sql2 = "insert into ReplyBoard (re_id, re_name, re_content,re_group,re_indent,qa_id)"
						+ " values(reply_board_sequence.nextval,'admin',?,?,?,?)";
			
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, content);
			pstmt2.setInt(2, 0);
			pstmt2.setInt(3, 0);
			pstmt2.setInt(4, no);
			
			rn2 = pstmt2.executeUpdate();
			
			if(rn2 == 1)
				System.out.println(rn2 + "개의 행이(가) 삽입되었습니다.");
			else
				System.out.println("실패");
			
			if(rn > 0)
				System.out.println(rn + "개의 행이 QnAboard에서 수정되었습니다.");
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
	
	public void rereR(int no, String re_id ,String name, String content) {
	      
	      int group = 0;
	      int indent = 0;
	      System.out.println("re_id:"+re_id);
	   
	      try {
	         conn = dataSource.getConnection();
	         
	         String sql = "select re_group,re_indent from ReplyBoard where re_id = ?";
	   
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, re_id);
	         rs= pstmt.executeQuery();
	         
	         while(rs.next())
	         {
	            group = rs.getInt("re_group")+1;
	            indent = rs.getInt("re_indent");
	            System.out.println("group:" + group);
	         }
	      
	         
	         String sql2 = "insert into ReplyBoard (re_id, re_name, re_content,re_group,re_indent,qa_id)"
	                  + " values(reply_board_sequence.nextval,?,?,?,?,?)";
	         
	         pstmt2 = conn.prepareStatement(sql2);
	         pstmt2.setString(1, name);
	         pstmt2.setString(2, content);
	         pstmt2.setInt(3, group);
	         
	         if(indent==0)
	            pstmt2.setString(4, re_id);
	         else
	            pstmt2.setInt(4,indent);
	         
	         pstmt2.setInt(5, no);
	         
	         rn2 = pstmt2.executeUpdate();
	         
	         if(rn2 == 1)
	            System.out.println(rs + "개의 행이(가) 삽입되었습니다.");
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
	

	//답글 삭제 (admin만 삭제 가능)
	public void deleteQ(int reNo, int qaNo) {
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "delete from ReplyBoard where re_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reNo);
			rn = pstmt.executeUpdate();
			
			
			
			String sql2 = "update QnAboard set qa_replycount = qa_replycount-1 where qa_id = ? and qa_replycount > 0";
					
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, qaNo);
			rn2 = pstmt2.executeUpdate();
			
			
			if(rn == 1)
				System.out.println(rn + "개의 행이(가) ReplyBoard로부터 삭제되었습니다.");
			else
				System.out.println("실패");
			
			if(rn2 == 1)
				System.out.println(rn + "개의 행이(가) 수정되었습니다.");
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
	
	public void deleteRR(int re_id) {
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "delete from ReplyBoard where re_indent = ?";
		
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, re_id);
				rn = pstmt.executeUpdate();
				
				
				System.out.println("reindent 가" + re_id +"인 행 "+rn+"개가 삭제되었습니다. ");
				
				

		}catch (SQLException e) {

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