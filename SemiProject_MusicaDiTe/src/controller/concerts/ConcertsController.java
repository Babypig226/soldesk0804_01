package controller.concerts;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConcertsController extends HttpServlet implements Servlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		String path;
		if(command.equals("/cct/concertList.cct")) {
			ConcertList action = new ConcertList();
			action.execute(request);
			path = "/concert_board/concert_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		else if(command.equals("/cct/concertWrite.cct")) {
			path = "/concert_board/concert_write.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);			
		}
		else if(command.equals("/cct/concertWriteIntensive.cct")) {
			ArtistsSearch action = new ArtistsSearch();
			action.execute(request);
			path = "/concert_board/popup_search_artists.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);						
		}
	
		//Popup
		else if(command.equals("/cct/artistsSearch.cct")) {
			path = "/concert_board/popup_search_artists.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);												
			
		}
		//공연정보 DB저장
		else if(command.equals("/cct/cctWritePro.cct")) {
			CctWritePro action = new CctWritePro();
			action.execute(request);
			response.sendRedirect("concertList.cct");
		}
		else if(command.equals("/cct/cctDetail.cct")) {
			ContentRead action = new ContentRead();
			action.execute(request);
			path = "/concert_board/concert_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);												
			
		}
		else if(command.equals("/cct/cctDetailCst.cct")) {
			ContentRead action = new ContentRead();
			action.execute(request);
			path = "/concert_board/concert_view_customer.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);												
			
		}
		//삭제
		else if(command.equals("/cct/cctDel.cct")) {
			CctDelete action = new CctDelete();
			action.execute(request);
			response.sendRedirect("concertList.cct");
			
		}
		//수정
		else if(command.equals("/cct/cctModify.cct")) {
			ContentRead action = new ContentRead();
			action.execute(request);
			path = "/concert_board/concert_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);												
		}
		else if(command.equals("/cct/concertModPro.cct")) {
			CctMod action = new CctMod();
			String num = action.execute(request);
			response.sendRedirect("cctDetail.cct?num=" + num);
		}
		else if(command.equals("/cct/pastConcertList.cct")) {
			SelectByYear action = new SelectByYear();
			action.execute(request);
			path = "/concert_board/concert_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		else if(command.equals("/cct/upcomingConcertList.cct")) {
			UpcomingSel action = new UpcomingSel();
			action.execute(request);
			path = "/concert_board/concert_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		}
	}

}
