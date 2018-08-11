package board.notice.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.ex.ntiDAO;
import board.notice.ex.ntiDTO;
import board.notice.ex.ntiNextListDTO;


public class ntiListCommand implements ntiCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ntiDAO dao = new ntiDAO();

		String count = request.getParameter("key");

		List<ntiDTO> list = dao.ntilist(count);
		ntiNextListDTO dto = dao.ntiNextList(count);
		String totalCount = dao.ntilistTotalcount();
		
		request.setAttribute("dto", dto);			
		request.setAttribute("list", list);
		request.setAttribute("totalCount", totalCount);
	}
}
