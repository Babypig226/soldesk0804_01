package controller.apply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ApplyDAO;
import model.DTO.ApplyDTO;

public class AppSel {
	public void execute(HttpServletRequest request) {
		String appTempNum = request.getParameter("num");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		
		ApplyDAO dao = new ApplyDAO();
		ApplyDTO dto = dao.appSel(appTempNum, userId);
		request.setAttribute("dto", dto);
	}

}
