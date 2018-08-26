package travel.searchview.command;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SearchViewMainCommand implements SearchViewCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SearchViewDAO dao = new SearchViewDAO();
		SearchViewDTO dto = new SearchViewDTO();
		List<SearchViewDTO> list = new ArrayList<SearchViewDTO>();
		
		dto.setFromLatitude(request.getParameter("fromLatitude"));
		dto.setFromLongitude(request.getParameter("fromLongitude"));
		dto.setToLatitude(request.getParameter("toLatitude"));
		dto.setToLongitude(request.getParameter("toLongitude"));
		dto.setFromName(request.getParameter("fromName"));
		dto.setToName(request.getParameter("toName"));	
		
		System.out.println(request.getParameter("fromLatitude"));
		System.out.println(request.getParameter("fromLongitude"));
		System.out.println(request.getParameter("toLatitude"));
		System.out.println(request.getParameter("toLongitude"));
		System.out.println(request.getParameter("fromName"));
		System.out.println(request.getParameter("toName"));
		

		HttpSession session=request.getSession();

		System.out.println("접속한 id : "+ session.getAttribute("id")); 

		//쿠키변수를 만들어서 값을 저장. 쿠키변수에 값이 있으면 조회수 증가 실행 하지 않음
		boolean isGet=false;
		Cookie[] cookies=request.getCookies();

		if(cookies!=null){   
			for(Cookie c: cookies){//    
				//num쿠키가 있는 경우
				if(c.getName().equals((String)session.getAttribute("id"))){
					System.out.println("이미 해당 아이디로 조회수가 올라 갔기 때문에 조회수 증가 x");
					isGet=true; 
				}
			}
			// num쿠키가 없는 경우
			if(!isGet) {
				dao.increaseHits(dto);//조회수증가
				Cookie c1 = new Cookie((String)session.getAttribute("id"), (String)session.getAttribute("id"));
				// 쿠키를 생성한다. (이름, 값)
				System.out.println("조회수 증가 o");
				c1.setMaxAge(1*24*60*60);//하루저장
				response.addCookie(c1);    
			}
		}

		dto = dao.getDestinationContents(dto); //제목, 내용 가져옴		
		list = dao.getDestinationFileName(dto); //파일 이름을 가져옴
		
		System.out.println(dto.getContent() + " : " + dto.getTitle());
		System.out.println(list.size());

		request.setAttribute("list", list);			
		request.setAttribute("dto", dto);	
	}
}
