package board.qna.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.ex.rDao;

public class ReplyWriteCommand implements qaCommand{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		//답글 작성 command 
		try {
			
			request.setCharacterEncoding("UTF-8");
			
			int no = Integer.parseInt(request.getParameter("qa_id"));
			String con = request.getParameter("comment");
			/*String pwd = request.getParameter("re_pwd");*/
			
			rDao rdao = new rDao();
			
			rdao.writeR(no, con);
			
			//dmlOk.jsp 에서 구분 
			request.setAttribute("test", "rw");
			
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
		
	};

}
