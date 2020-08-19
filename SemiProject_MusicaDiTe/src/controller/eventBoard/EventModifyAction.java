package controller.eventBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.EventBoardDAO;
import model.DTO.EventBoardDTO;

public class EventModifyAction {
	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		EventBoardDTO dto = new EventBoardDTO();
		dto.setEventContent(request.getParameter("eventContent"));
		dto.setEventNo(Long.parseLong(request.getParameter("eventNo")));
		dto.setEventSubject(request.getParameter("eventSubject"));
		HttpSession session = request.getSession();
		dto.setEuserId((String) session.getAttribute("logId"));
		EventBoardDAO dao = new EventBoardDAO();
		dao.eventUpdate(dto);
	}
}
