package controller.eventBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventBoardController extends HttpServlet implements Servlet {

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/eve/eveBoardList.eve")) { // 이벤트 게시판 클릭 시 이벤트 게시판 이동
			EventListAction action = new EventListAction();
			action.execute(req);
			String path = "/event/eventBoardList.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/eve/eveForm.eve")) { // 글쓰기 버튼 클릭 시 글쓰기 폼으로 이동
			String path = "/event/eventBoardWrite.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/eve/eveWrite.eve")) { // 글 작성후 완료 버튼 클릭 시 리스트로 이동
			EventWriteAction action = new EventWriteAction();
			action.execute(req);
			resp.sendRedirect("eveBoardList.eve");
		} else if (command.equals("/eve/eveDetail.eve")) { // 리스트의 글 제목 클릭 시 상세내용 보이기
			EventDetailAction action = new EventDetailAction();
			action.execute(req);
			String path = "/event/eventCollection.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if (command.equals("/eve/eveModify.eve")) { // 상세내용에서 수정 버튼 클릭 시 수정 화면이 뜸
			EventDetailAction action = new EventDetailAction();
			action.execute(req);
			String path = "/event/eventBoardModify.jsp";
			RequestDispatcher dispatcher = req.getRequestDispatcher(path);
			dispatcher.forward(req, resp);
		} else if ( command.equals("/eve/eveModifyPro.eve")) { // 수정완료 후 디테일페이지 보이기
			EventModifyAction action = new EventModifyAction();
			action.execute(req);
			resp.sendRedirect("eveDetail.eve?eventNo=" + req.getParameter("eventNo"));
		} else if (command.equals("/eve/eveDelete.eve")) { // 삭제 버튼 클릭하면 팝업뜨고 삭제 후 리스트로 돌아가기
			EventDeleteAction action = new EventDeleteAction();
			action.execute(req);
			resp.sendRedirect("eveBoardList.eve");
		} else if (command.equals("/eve/replyInsert.eve")) {
			ReplyInsertAction action = new ReplyInsertAction();
			action.execute(req);
			resp.sendRedirect("" + "eveDetail.eve?eventNo=" + req.getParameter("eventNo"));
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
