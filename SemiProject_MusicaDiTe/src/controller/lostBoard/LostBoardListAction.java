package controller.lostBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.LostBoardDAO;
import model.DTO.LostBoardDTO;

public class LostBoardListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;

		String num = null;
		LostBoardDAO dao = new LostBoardDAO();
		List<LostBoardDTO> list = dao.lostSelectAll(page, limit, num);
		Integer count = dao.lostCount();
		request.setAttribute("list", list);
		request.setAttribute("count", count);

		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "lostBoardList.lost?");
	}
}
