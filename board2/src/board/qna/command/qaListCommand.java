package board.qna.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.ex.qaDao;
import board.qna.ex.qaDto;

public class qaListCommand implements qaCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//QnA 목록 command
		qaDao dao = new qaDao();
		ArrayList<qaDto> list = new ArrayList<qaDto>();
		
		list = dao.listQ();
		request.setAttribute("list", list);
	};

}