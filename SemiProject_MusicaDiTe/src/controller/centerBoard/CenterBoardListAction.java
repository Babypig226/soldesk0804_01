package controller.centerBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.CenterBoardDAO;
import model.DTO.CenterBoardDTO;


public class CenterBoardListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = 
				Integer.parseInt(
						request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		String num = null;
		CenterBoardDAO dao = new CenterBoardDAO();
		List<CenterBoardDTO> list =
				dao.cenSelectAll(page, limit, num);
		Integer count = dao.cenCount();
		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
				
		PageAction action = new PageAction();
		action.page(request, count, limit, limitPage, page,
				"cenBoardList.cen?");
	}
}


