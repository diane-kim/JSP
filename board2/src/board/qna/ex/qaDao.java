package board.qna.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class qaDao {

	DataSource dataSource;
	Connection conn = null;
	Connection conn2 = null;
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
	
	public int countOneQ (int qaNo) {
		
		int count = 0;
		
	
		try {
			conn = dataSource.getConnection();

			String sql = "select count(*) from ReplyBoard where qa_id = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qaNo);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				System.out.println("replyCount 검색 성공 ");
				count = 1;
			} else {
					System.out.println("실패");		
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
		return count;
	
	}
	//QnA 내용 보기 + 조회수 1 증가 
	public qaDto contentQ(int no,String check) {
		qaDto dto = new qaDto();

		try {
			conn = dataSource.getConnection();

			if(("true").equals(check)) {
				String sql = "update QnAboard set qa_read = qa_read+1 where qa_id =?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rn = pstmt.executeUpdate();

			}


			String sql2 = "select qa_id, qa_name, qa_subject,qa_content, qa_pwd, to_char(qa_date,'yyyy-MM-dd HH:mm') qa_date , qa_read, qa_replyCount,write_id from QnAboard" 
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
				dto.setQa_date(rs2.getString("qa_date"));
				dto.setQa_read(rs2.getInt("qa_read"));
				dto.setQa_count(rs2.getInt("qa_replyCount"));
				dto.setWrite_id(rs2.getString("write_id"));

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
	public void writeQ(String name, String subject, String content, String pwd,String id) {

		try {
			conn = dataSource.getConnection();

			String sql = "insert into QnAboard values(qna_board_sequence.nextval,?,?,?,sysdate,0,0,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, pwd);
			pstmt.setString(5, id);

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
			
			if(countOneQ(no)>0) {
			conn = dataSource.getConnection();
			
			String sql2 = "delete from ReplyBoard where qa_id = ?";

			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, no);
			
			rn2 = pstmt.executeUpdate();
			}}catch (SQLException e) {

				e.printStackTrace();
			}finally {
				try {
					
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch (SQLException e) {

					e.printStackTrace();
				}}
			try {
					conn = dataSource.getConnection();
					
					String sql = "delete from QnAboard where qa_id = ?";

					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					rn = pstmt.executeUpdate();

					

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
	//QnAboard 총 column 개수 
	public String CountList() {

		String count = null;

		String sql = "select count(*) as count from QnAboard";

		try {

			conn = dataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			rs.next();
			count=rs.getString("count");


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



		return count;
	}
	
	//QnAboard 총 search column 개수 
	public String searchCountList(String content) {

		String count = null;

		String sql = "select count(*) as count from QnAboard where qa_subject like '%" + content + "%'";

		try {

			conn = dataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			rs.next();
			count=rs.getString("count");


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



		return count;
	}

	//QnAboard 목록
	public List<qaDto> listQ(String pageNum){

		int i = 1;
		int rCount = 0;
		qaDto dto = null;
		List<qaDto> list = new ArrayList<>();

		try {

			conn = dataSource.getConnection();

			int page;

			if (pageNum == null) {
				page = 1;
			} else {
				page = Integer.parseInt(pageNum);
			} 

			int countPage = 10;

			int query_startPage = (page - 1) * countPage + 1; 
			int query_endPage = page * countPage; 



			String sql2 = "select * from ("

				+ "select rownum as rnum, A.qa_id, A.qa_name, A.qa_subject,A.qa_pwd,A.qa_date,"

				+ "A.qa_read,A.qa_replyCount"

				+ " from ("

				+ "select qa_id, qa_name, qa_subject,qa_pwd,to_char(qa_date,'yyyy-MM-dd HH:mm') as qa_date, qa_read, qa_replyCount"

				+ " from QnAboard"

				+ " order by qa_id desc) A"

				+ " where rownum <= " + query_endPage + ") X"

				+ " where X.rnum >= " + query_startPage + "";



			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			ResultSet rs2 = pstmt2.executeQuery();
			while (rs2.next()) {
				dto =new qaDto();

				dto.setQa_id(rs2.getInt("qa_id"));
				dto.setQa_name(rs2.getString("qa_name"));
				dto.setQa_sub(rs2.getString("qa_subject"));
				dto.setQa_pwd(rs2.getString("qa_pwd"));
				dto.setQa_date(rs2.getString("qa_date"));
				dto.setQa_read(rs2.getInt("qa_read"));
				rCount = rs2.getInt("qa_replyCount");
				
				if(rCount < 0 )
					dto.setQa_count(0);
				else
					dto.setQa_count(rCount);

				list.add(dto);
				System.out.println(i++);
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

		return list;
	}


	public List<qaDto> searchQ(String pageNum,String content){

		int i = 1;
		qaDto dto = null;
		List<qaDto> list = new ArrayList<>();
		System.out.println("content:"+content);

		try {

			conn = dataSource.getConnection();

			int page;

			if (pageNum == null) {
				page = 1;
			} else {
				page = Integer.parseInt(pageNum);
			} 

			int countPage = 10;

			int query_startPage = (page - 1) * countPage + 1; 
			int query_endPage = page * countPage; 



			String sql2 = "select * from ("

				+ "select rownum as rnum, A.qa_id, A.qa_name, A.qa_subject,A.qa_pwd,A.qa_date,"

				+ "A.qa_read,A.qa_replyCount"

				+ " from ("

				+ "select qa_id, qa_name, qa_subject,qa_pwd, to_char(qa_date,'yyyy-MM-dd HH:mm') qa_date , qa_read, qa_replyCount"

				+ " from QnAboard"

				+ " where qa_subject LIKE '%" + content + "%'"

				+ " order by qa_id desc) A"

				+ " where rownum <= " + query_endPage + ") X"

				+ " where X.rnum >= " + query_startPage + "";



			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			ResultSet rs2 = pstmt2.executeQuery();
			while (rs2.next()) {
				dto =new qaDto();

				dto.setQa_id(rs2.getInt("qa_id"));
				dto.setQa_name(rs2.getString("qa_name"));
				dto.setQa_sub(rs2.getString("qa_subject"));
				dto.setQa_pwd(rs2.getString("qa_pwd"));
				dto.setQa_date(rs2.getString("qa_date"));
				dto.setQa_read(rs2.getInt("qa_read"));
				dto.setQa_count(rs2.getInt("qa_replyCount"));

				list.add(dto);
				System.out.println(i++);
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

		return list;
	}




}