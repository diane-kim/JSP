package travel.sendMessage.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.jhw")
public class sendMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   
    public sendMessageController() {
        super();
    
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(req,res);
	
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(req,res);
		
	}

	protected void actionDo(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		sendMessageCommand smc = null;
		
		String uri = req.getRequestURI();
		String conPath = req.getContextPath();
		String com = uri.substring(conPath.length());
		
		
		if(com.equals("/admintomessage.jhw")) {
			smc = new sendMessageInCommand();
			smc.execute(req, res);
			viewPage = "main.jsp";			
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/travel/"+viewPage);
		
		dispatcher.forward(req, res);	
	}
}
