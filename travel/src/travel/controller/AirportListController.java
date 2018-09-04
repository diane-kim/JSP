package travel.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travel.airportList.command.AirportListCommand;
import travel.airportList.command.AirportListMainCommand;
import travel.airportList.command.AirportListReservationCommand;

@WebServlet("*.al")
public class AirportListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AirportListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String viewPage = null;
		AirportListCommand alc;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());		
			
		if (com.equals("/AirportList.al")) {
			System.out.println("AirportList 호출");			
			alc = new AirportListMainCommand();
			alc.execute(request, response);
			viewPage = "/airportList.jsp";
		}else if (com.equals("/AirportReservation.al")) {
			System.out.println("AirportReservation 호출");			
			alc = new AirportListReservationCommand();
			alc.execute(request, response);
			viewPage = "/View/Reservation.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		
		dispatcher.forward(request, response);	
	}
}
