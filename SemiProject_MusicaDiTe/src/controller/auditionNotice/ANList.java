package controller.auditionNotice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.AuditionNoticeDAO;
import model.DTO.AuditionNoticeDTO;

public class ANList {

	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		AuditionNoticeDAO dao = new AuditionNoticeDAO();	
		List<AuditionNoticeDTO> list = dao.anSel();
		int count = dao.countList();
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "auditionList.aud?");
	}

}
