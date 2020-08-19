package controller.eventBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.EventBoardDAO;
import model.DTO.EventBoardDTO;

public class EventWriteAction {
	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		EventBoardDTO dto = new EventBoardDTO();
		dto.setEventSubject(request.getParameter("eventSubject"));
		dto.setEventContent(request.getParameter("eventContent"));

		HttpSession session = request.getSession();

		dto.setEuserId((String) session.getAttribute("logId"));
		
		EventBoardDAO dao = new EventBoardDAO();
		dao.eventInsert(dto);

	}
}
