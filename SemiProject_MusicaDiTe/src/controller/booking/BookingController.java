package controller.booking;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.concerts.ContentRead;
import controller.member.MemberChk;
import controller.ticket.TktRead;

public class BookingController extends HttpServlet implements Servlet{
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
		
		if(command.equals("/bk/book.bk")) {
			TktRead action = new TktRead();
			action.execute(request);
			MemberChk action1 = new MemberChk();
			action1.execute(request);
			path = "/booking/booking.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		else if(command.equals("/bk/bookingConfirm.bk")) {
			BookingNext action = new BookingNext();
			action.execute(request);
			MemberChk action1 = new MemberChk();
			action1.execute(request);
			ContentRead action2 = new ContentRead();
			action2.execute(request);
			path = "/booking/booking_step2.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);			
		}
		else if(command.equals("/bk/paycheck.bk")) {
			CartSet action = new CartSet();
			action.execute(request);
			response.sendRedirect("../main.main");			
		}
		else if(command.equals("/bk/purchaseList.bk")) {
			CartRead action = new CartRead();
			action.execute(request);
			path = "/booking/purchase_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);			
			
		}
	}
}
