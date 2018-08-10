package board.qna.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.ex.rDao;

public class ReplyDeleteCommand implements qaCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//Reply 삭제 command, admin만 가능 
		int re_id = Integer.parseInt(request.getParameter("re_id"));
		System.out.println(re_id);
		
		rDao dao = new rDao();
		dao.deleteQ(re_id);
		
		//dmlOk.jsp 에서 구분 
		request.setAttribute("test", "rd");
		
	}
	
	

}
