package travel.airportList.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.member.com.MemberDAO;
import travel.member.com.MemberDTO;

public class AirportListMainCommand implements AirportListCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		HttpSession session=request.getSession();

		String f = request.getParameter("f");
		String t = request.getParameter("t");
		
		String id = (String) session.getAttribute("id");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String num = request.getParameter("num");
		String seat =  request.getParameter("seat");
		String fromdate =  request.getParameter("fromdate");
		String todate =  request.getParameter("todate");

		System.out.println(num + " " + seat + " " + fromdate + " " + todate + " " + t+ " "+ f);
		
		System.out.println("접속한 ID : "+ id); 
		int check = 0;
		if(id == null) {
			check  = 1;
			System.out.println("로그인 안 했을때 1을 반환 : " + check);
		}else {
			dto = dao.getMemberInfo(id); //이름,이메일,핸드폰 정보를 가져옴
		}
		
		request.setAttribute("dto", dto);	//이름,이메일,핸드폰 정보
		request.setAttribute("num", num);	//성인 카운트		
		request.setAttribute("seat", seat);
		request.setAttribute("fromdate", fromdate);	
		request.setAttribute("todate", todate);		
		request.setAttribute("from", from);	
		request.setAttribute("to", to);		
		request.setAttribute("f", f);	
		request.setAttribute("t", t);		
		request.setAttribute("check", check);	//로그인 여부 확인
	}	
}
