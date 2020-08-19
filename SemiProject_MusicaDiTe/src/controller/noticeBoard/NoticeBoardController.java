package controller.noticeBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeBoardController extends HttpServlet implements Servlet {

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/not/notBoardList.not")) { // 공지사항 게시판 링크 클릭 시 게시판 보이기
			NoticeListAction action = new NoticeListAction();
			action.execute(req);
			String path = "/noticeBoard/noticeBoardList.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/not/notBoardForm.not")) { // 글쓰기 버튼 클릭 시 글쓰기 폼 나옴
			String path = "/noticeBoard/noticeBoardWrite.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/not/notBoardWrite.not")) { // 글쓰고 작성완료 버튼 클릭 시 리스트에 보여짐
			NoticeBoardWriteAction action = new NoticeBoardWriteAction();
			action.execute(req);
			resp.sendRedirect("notBoardList.not");
		} else if (command.equals("/not/notBoardDetail.not")) { // 리스트의 글 제목 클릭 시 상세내용 보이기
			NoticeBoardDetailAction action = new NoticeBoardDetailAction();
			action.execute(req);
			String path = "/noticeBoard/noticeBoardView.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/not/notBoardModify.not")) { // 상세 내용에서 수정 버튼 클릭 시 수정 페이지 이동
			NoticeBoardDetailAction action = new NoticeBoardDetailAction();
			action.execute(req);
			String path = "/noticeBoard/noticeBoardModify.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/not/noticeBoardModifyPro.not")) { // 수정 후 버튼 클릭 시 수정 성공
			NoticeBoardModifyAction action = new NoticeBoardModifyAction();
			String num = action.execute(req);
			resp.sendRedirect("notBoardDetail.not?num=" + num);
		} else if (command.equals("/not/notBoardDel.not")) {
			String path = "/noticeBoard/noticeBoardDelete.jsp";
			req.setAttribute("noticeNum", req.getParameter("num"));
			System.out.println(req.getParameter("num"));
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/not/notBoardDelPro.not")) {
			NoticeBoardDelAction action = new NoticeBoardDelAction();
			action.execute(req);
			resp.sendRedirect("notBoardList.not");
		}
	}

	//
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
