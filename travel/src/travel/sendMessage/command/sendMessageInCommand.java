package travel.sendMessage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.sendMessage.com.sendMessageDAO;

public class sendMessageInCommand implements sendMessageCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//기능 담당
		//테이블 생성
		//DAO, DTO 만들어야됨
		sendMessageDAO dao = new sendMessageDAO();
		
		request.getParameter("Name");
		/*dao.insert();*/
		
	}
}
