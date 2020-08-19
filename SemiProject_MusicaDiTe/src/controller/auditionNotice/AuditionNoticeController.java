package controller.auditionNotice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuditionNoticeController extends HttpServlet implements Servlet{
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
		
		if (command.equals("/aud/auditionList.aud")) {
			ANList action = new ANList();
			action.execute(request);
			path = "/management_board/audition_notice_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		else if(command.equals("/aud/audForm.aud")) {
			path = "/management_board/audition_notice_form_write.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		else if(command.equals("/aud/audNoticeInsert.aud")) {
			ANInsert action = new ANInsert();
			action.execute(request);
			response.sendRedirect("auditionList.aud");
		}
		else if(command.equals("/aud/audNoticeView.aud")) {
			ANSel action = new ANSel();
			action.execute(request);
			path = "/management_board/audition_notice_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);			
		}
		else if(command.equals("/aud/audNoticeModify.aud")) {
			ANSel action = new ANSel();
			action.execute(request);			
			path = "/management_board/audition_notice_form_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);			
		}
		else if(command.equals("/aud/audNoticeMPro.aud")) {
			ANMod action = new ANMod();
			String num = action.execute(request);
			response.sendRedirect("audNoticeView.aud?num="+ num);
			
		}
		else if(command.equals("/aud/audNoticeDel.aud")) {
			ANDel action = new ANDel();
			action.execute(request);
			response.sendRedirect("auditionList.aud");
		}
	}

}
