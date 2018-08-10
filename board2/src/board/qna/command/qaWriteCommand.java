package board.qna.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import board.qna.ex.qaDao;


public class qaWriteCommand implements qaCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		//QnA 작성 하기 
		try {
			request.setCharacterEncoding("UTF-8");
			
			String subject = request.getParameter("subject");
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			String pwd = request.getParameter("qa_pwd");
		
			qaDao dao = new qaDao();
			
			dao.writeQ(name, subject, content,pwd);
			
			//dmlOk.jsp 에서 구분 
			request.setAttribute("test", "qw");
			
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		
		
		
		
	};
}

