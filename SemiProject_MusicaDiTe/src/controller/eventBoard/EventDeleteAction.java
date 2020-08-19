package controller.eventBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.EventBoardDAO;

public class EventDeleteAction {
	public void execute(HttpServletRequest request) {
		String eventNo = request.getParameter("eventNo");
		HttpSession session = request.getSession();
		String euserId = (String) session.getAttribute("logId");
		
		EventBoardDAO dao = new EventBoardDAO();
		dao.eventDelete(eventNo, euserId);
	}
}
