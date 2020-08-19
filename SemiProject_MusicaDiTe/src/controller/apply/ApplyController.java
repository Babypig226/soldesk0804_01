package controller.apply;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.auditionNotice.ANSel;
import model.DTO.ApplyDTO;

public class ApplyController extends HttpServlet implements Servlet{
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
		String path = "";
		
		if(command.equals("/app/appRegist.app")) {
			ANSel action = new ANSel();
			action.execute(request);
			path = "/ApplyForm/applyRegister.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		}
		else if(command.equals("/app/applyRegisterPro.app")) {
			ApplyInsert action = new ApplyInsert();
			int num = action.execute(request);
			response.sendRedirect("appTempStore.app?num="+num);
		}
		else if(command.equals("/app/appTempStore.app")) {
			AppSel action = new AppSel();
			action.execute(request);
			path = "/ApplyForm/applyTempStore.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		else if(command.equals("/app/appTempStoreList.app")) {
			AppSelAll action = new AppSelAll();
			action.execute(request);
			path = "/ApplyForm/apply_temp_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		else if(command.equals("/app/appModify.app")) {			
			AppSel action = new AppSel();
			action.execute(request);
			path = "/ApplyForm/applyModify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
		else if(command.equals("/app/appDel.app")) {
			AppDel action = new AppDel();
			action.execute(request);
			response.sendRedirect("appTempStoreList.app");
		}
		else if(command.equals("/app/appTempMod.app")) {
			AppMod action = new AppMod();
			action.execute(request);
			response.sendRedirect("appTempStoreList.app");
		}
		else if(command.equals("/app/applyFinOk.app")) {
			AppFin action = new AppFin();
			action.execute(request);
			response.sendRedirect("appFinList.app");
		}
		else if(command.equals("/app/appFinList.app")) { //user 등록 완료한 오디션 신청서 보기
			AppFnList action = new AppFnList();
			action.execute(request);
			path = "/ApplyForm/apply_fin_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		}
		else if(command.equals("/app/appFinView.app")) { //user 등록 완료한 오디션 신청서 보기
			AppFnDetail action = new AppFnDetail();
			action.execute(request);
			path = "/ApplyForm/apply_fin_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		}

	}
}
