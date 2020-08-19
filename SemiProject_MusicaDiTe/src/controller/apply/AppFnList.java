package controller.apply;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import controller.PageAction;
import model.DAO.ApplyDAO;
import model.DTO.ApplyFinDTO;

public class AppFnList {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		ApplyDAO dao = new ApplyDAO();
		List<ApplyFinDTO> list= dao.selFnList(userId);
		Integer count = dao.countFin(userId);
		request.setAttribute("fnList", list);
		request.setAttribute("fnCount", count);
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "appFinList.app?");
	}

}
