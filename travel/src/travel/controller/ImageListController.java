package travel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.image.command.ImageListCommand;
import travel.image.command.ImageListUploadCommand;
import travel.image.command.MainImageListCommand;


@WebServlet("*.mjy")
public class ImageListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   
    public ImageListController() {
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
		ImageListCommand ilc = null;
		
		String uri = req.getRequestURI();
		String conPath = req.getContextPath();
		String com = uri.substring(conPath.length());
				
		
		if(com.equals("/imageUpload.mjy")) {
			ilc = new ImageListUploadCommand();
			System.out.println("파일 업로드");
			ilc.execute(req, res);
			viewPage = "main.jsp";
		}else if(com.equals("/imageList.mjy")) {
			ilc = new MainImageListCommand();
			System.out.println("이미지 리스트 호출");
			ilc.execute(req, res);
			
			viewPage = "main.jsp";			
		}		
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		
		dispatcher.forward(req, res);	
	}
}
