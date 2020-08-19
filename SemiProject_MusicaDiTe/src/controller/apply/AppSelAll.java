package controller.apply;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import controller.PageAction;
import model.DAO.ApplyDAO;
import model.DTO.ApplyDTO;

public class AppSelAll {

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
		List<ApplyDTO> list = new ArrayList<ApplyDTO>(); 
				list = dao.setList(userId);
		Integer count = dao.countApplications(userId);
		request.setAttribute("lists", list);
		request.setAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "appTempStoreList.app?");
		
	}

}
