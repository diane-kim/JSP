package board.notice.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.ex.ntiDAO;
import board.notice.ex.ntiDTO;


public class ntiListCommand implements ntiCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ntiDAO dao = new ntiDAO();

		String count = null;

		List<ntiDTO> list = dao.ntilist(count);
		
		request.setAttribute("list", list);
		
/*		for(ntiDTO n : list)
		{			
			System.out.println(n);						
		}*/
	}
}
