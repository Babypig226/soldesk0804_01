package controller.eventBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.EventBoardDAO;
import model.DTO.EventBoardDTO;

public class EventListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;

		EventBoardDAO dao = new EventBoardDAO();
		List<EventBoardDTO> list = dao.eventSelectAll(page, limit);
		Integer count = dao.eventCount();

		request.setAttribute("list", list);
		request.setAttribute("count", count);

		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "eveBoardList.eve?");
	}
}
