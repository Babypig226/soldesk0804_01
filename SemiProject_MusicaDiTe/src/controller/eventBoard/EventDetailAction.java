package controller.eventBoard;

import javax.servlet.http.HttpServletRequest;

import model.DAO.EventBoardDAO;
import model.DTO.EventRepliesDTO;

public class EventDetailAction {
	public void execute(HttpServletRequest request) {
		EventBoardDAO dao = new EventBoardDAO();
		String eventNo = request.getParameter("eventNo");
		EventRepliesDTO dto = dao.eventCollection(eventNo);
		request.setAttribute("eveReDTO", dto);
	}
}
