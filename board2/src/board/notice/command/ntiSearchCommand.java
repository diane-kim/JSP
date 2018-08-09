package board.notice.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.ex.ntiDAO;
import board.notice.ex.ntiDTO;
import board.notice.ex.ntiNextListDTO;

public class ntiSearchCommand implements ntiCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ntiDAO dao = new ntiDAO();
		
		String count = request.getParameter("key");
		String content = request.getParameter("content");

		List<ntiDTO> list = dao.ntiSearchList(count, content);
		ntiNextListDTO dto = dao.ntiNextList(count);
		
		request.setAttribute("dto", dto);			
		request.setAttribute("list", list);
	}
}
