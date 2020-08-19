package controller.ticket;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.concerts.ConcertList;
import controller.concerts.ContentRead;

public class TicketController extends HttpServlet implements Servlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		String path;
		
		if(command.equals("/tkt/ticketsList.tkt")) {
			ConcertList action = new ConcertList();
			action.execute(request);
			path = "/tickets/tickets_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		//티켓정보 등록페이지 이동
		else if(command.equals("/tkt/ticketInfoReg.tkt")) {
			ContentRead action = new ContentRead();
			action.execute(request);
			path = "/tickets/tickets_register.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		//db에 입력
		else if(command.equals("/tkt/ticketSs.tkt")){
			TktRegistAction action = new TktRegistAction();
			action.execute(request);
			ContentRead action1 = new ContentRead();
			action1.execute(request);
			path = "/tickets/ticket_info_check.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		//ticket정보 읽기
		else if(command.equals("/tkt/ticketInfo.tkt")) {
			TktRead action = new TktRead();
			action.execute(request);
			path = "/tickets/ticket_info_detail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
	}
	

}
