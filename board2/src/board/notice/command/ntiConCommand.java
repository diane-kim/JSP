package board.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.ex.ntiDAO;
import board.notice.ex.ntiDTO;

public class ntiConCommand implements ntiCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(request.getParameter("id"));

		ntiDAO dao = new ntiDAO();
		
		ntiDTO dto = new ntiDTO();
		
		request.setAttribute("dto",dto);
	}


}
