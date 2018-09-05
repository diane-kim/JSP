package travel.airportList.com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import travel.airportList.com.AirportListDTO;
import travel.member.com.MemberDTO;

public class AirportListDAO {
	DataSource dataSource;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	AirportListDTO dto = null;
	List<AirportListDTO> dtos = null;

	// 커넥션 풀 사용
	public AirportListDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void InsertReservationInfo(AirportListDTO DTO) throws SQLException {
		try {
			
			String sql = "INSERT INTO reservation(KEY, DEPARTURE, ARRIVAL, DEPARTURE_DATE, DEPARTURE_TIME, ARRIVAL_TIME, FLIGHT_NUMBER, TICKET, SEAT, PRICE, TOTAL_PRICE, AIRLINE, LNAME, FNAME, NATIONALITY, PHONE, EMAIL, ID) "
					+ "VALUES ( reservation_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			conn.setAutoCommit(false);
			pstmt.setString(1, DTO.getDEPARTURE());
			pstmt.setString(2, DTO.getARRIVAL());
			pstmt.setString(3, DTO.getDEPARTURE_DATE());
			pstmt.setString(4, DTO.getDEPARTURE_TIME());
			pstmt.setString(5, DTO.getARRIVAL_TIME());
			pstmt.setString(6, DTO.getFLIGHT_NUMBER());
			pstmt.setInt(7, DTO.getTICKET());
			pstmt.setString(8, DTO.getSEAT());
			pstmt.setString(9, DTO.getPRICE());
			pstmt.setString(10, DTO.getTOTAL_PRICE());
			pstmt.setString(11, DTO.getAIRLINE());
			pstmt.setString(12, DTO.getLNAME());
			pstmt.setString(13, DTO.getFNAME());
			pstmt.setString(14, DTO.getNATIONALITY());
			pstmt.setString(15, DTO.getPHONE());
			pstmt.setString(16, DTO.getEMAIL());
			pstmt.setString(17, DTO.getID());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			conn.rollback();
			e.printStackTrace();
		} finally {
			conn.commit();
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}