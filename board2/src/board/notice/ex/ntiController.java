package board.notice.ex;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.command.ntiCommand;
import board.notice.command.ntiViewCommand;
import board.notice.command.ntiListCommand;

@WebServlet("*.mjy")
public class ntiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   
    public ntiController() {
        super();
    
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		actionDo(req,res);
	
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		actionDo(req,res);
	}

	protected void actionDo(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String viewPage = null;
		ntiCommand qac = null;
		
		String uri = req.getRequestURI();
		String conPath = req.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/ntiList.mjy")) {
			qac = new ntiListCommand();
			qac.execute(req, res);
			viewPage = "ntilist.jsp";
		}else if(com.equals("/ntiView.mjy")) {
			qac = new ntiViewCommand();
			qac.execute(req, res);
			viewPage = "view.jsp";
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/notice/"+viewPage);
		
		dispatcher.forward(req, res);		
	}	
}
