package controller.lostBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LostBoardController extends HttpServlet implements Servlet {

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/lost/lostBoardList.lost")) { // 분실물 게시판 링크 클릭 시
			LostBoardListAction action = new LostBoardListAction();
			action.execute(req);
			String path = "/lostBoard/lostBoardList.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/lost/lostBoardForm.lost")) { // 글쓰기 버튼 클릭 시 글쓰기 폼 나옴
			String path = "/lostBoard/lostBoardWrite.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/lost/lostBoardWrite.lost")) { // 작성 완료? 버튼 클릭 시 리스트에 보여짐
			LostBoardWriteAction action = new LostBoardWriteAction();
			action.execute(req);
			resp.sendRedirect("lostBoardList.lost");
		} else if (command.equals("/lost/lostBoardDetail.lost")) {
			LostBoardDetailAction action = new LostBoardDetailAction();
			action.execute(req);
			String path = "/lostBoard/lostBoardView.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/lost/lostBoardModify.lost")) {
			LostBoardDetailAction action = new LostBoardDetailAction();
			action.execute(req);
			String path = "/lostBoard/lostBoardModify.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/lost/lostBoardModifyPro.lost")) {
			LibBoardModifyAction action = new LibBoardModifyAction();
			String num = action.execute(req);
			resp.sendRedirect("lostBoardDetail.lost?num=" + num);
		} else if (command.equals("/lost/lostBoardDel.lost")) {
			String path = "/lostBoard/lostBoardDelete.jsp";
			req.setAttribute("boardNum", req.getParameter("num"));
			System.out.println(req.getParameter("num"));
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/lost/lostBoardDelPro.lost")) {
			LostBoardDelAction action = new LostBoardDelAction();
			action.execute(req);
			resp.sendRedirect("lostBoardList.lost");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
