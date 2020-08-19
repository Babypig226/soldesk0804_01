package controller.concerts;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import controller.PageAction;
import model.DAO.ConcertsDAO;
import model.DTO.ConcertsDTO;

public class ConcertList {
		public void execute(HttpServletRequest request) {
			
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			int limit = 10;
			int limitPage = 10;
			
			HttpSession session = request.getSession();
			String employeeId = (String)session.getAttribute("logId");
			ConcertsDAO dao = new ConcertsDAO();
			List<ConcertsDTO> dto = dao.selAll();
			int count = dao.count();
			request.setAttribute("dto", dto);
			request.setAttribute("count", count);
			
			PageAction pageAction = new PageAction();
			pageAction.page(request, count, limit, limitPage, page, "concertList.cct?");
		}



}
