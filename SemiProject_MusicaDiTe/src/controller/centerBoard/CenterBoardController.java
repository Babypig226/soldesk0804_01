package controller.centerBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CenterBoardController extends HttpServlet implements Servlet {

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		String path;
		if (command.equals("/cen/cenmain.cen")) { // 메인에서 고객센터 클릭 시 고객센터 게시판으로 이동
			path = "/center/centerMain.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/cen/cenBoardList.cen")) { // 1:1 문의 링크 클릭 시 1:1 문의 게시판으로 이동
			CenterBoardListAction action = new CenterBoardListAction();
			action.execute(req);
			path = "/center/centerBoardList.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/cen/cenWrite.cen")) { // 글쓰기 버튼 클릭 시 글쓰기 폼 보임
			path = "/center/centerboardWrite.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/cen/cenBoardWritePro.cen")) { // 글 작성 후 버튼 클릭 시 글등록 성공
			CenterBoardWriteAction action = new CenterBoardWriteAction();
			action.execute(req);
			resp.sendRedirect("cenBoardList.cen");
		} else if (command.equals("/cen/cenBoardDetail.cen")) { // 리스트에서 제목 클릭 시 세부사항 내용 보임
			cenBoardDetailAction action = new cenBoardDetailAction();
			action.execute(req);
			path = "/center/centerBoardView.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/cen/cenBoardModify.cen")) { // 수정 버튼 클릭 시 수정페이지로 이동
			cenBoardDetailAction action = new cenBoardDetailAction();
			action.execute(req);
			path = "/center/centerBoardmodify.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/cen/cenBoardModifyPro.cen")) { // 수정 한 뒤 수정 버튼 클릭하면 수정됨
			CenterBoardModifyAction action = new CenterBoardModifyAction();
			String num = action.execute(req);
			resp.sendRedirect("cenBoardDetail.cen?boardNum=" + num);
		} else if (command.equals("/cen/cenBoardDelete.cen")) { // 삭제 버튼 클릭 시
			req.setAttribute("boardNum", req.getParameter("boardNum"));
			path = "/center/centerBoarddelete.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/cen/cenBoardDelPro.cen")) {
			CenterBoardDelAction action = new CenterBoardDelAction();
			action.execute(req);
			resp.sendRedirect("cenBoardList.cen");
		} else if (command.equals("/cen/cenBoardReply.cen")) { // 답변 클릭시 답변폼 열림
			cenBoardDetailAction action = new cenBoardDetailAction();
			action.execute(req);
			path = "/center/centerBoardReply.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/cen/cenBoardReplyPro.cen")) { // 답변내용 쓰고
			CenterBoardReplyAction action = new CenterBoardReplyAction();
			action.execute(req);
			resp.sendRedirect("cenBoardList.cen");
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
