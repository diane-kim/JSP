package board.file;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.notice.command.ntiCommand;
import board.notice.command.ntiListCommand;
import board.notice.command.ntiSearchCommand;
import board.notice.command.ntiViewCommand;


@WebServlet("*.fmjy")
public class ImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ImgController() {
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
		
		if(com.equals("/image.fmjy")) {
			viewPage = "list.jsp";
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/file/"+viewPage);
		
		dispatcher.forward(req, res);		
	}	

}
