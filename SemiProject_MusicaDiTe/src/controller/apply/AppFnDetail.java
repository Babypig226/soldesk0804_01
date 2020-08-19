package controller.apply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ApplyDAO;
import model.DTO.ApplyFinDTO;

public class AppFnDetail {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		String regNum = request.getParameter("num");
		ApplyDAO dao = new ApplyDAO();
		ApplyFinDTO dto = dao.selFnOne(userId, regNum);
		request.setAttribute("dto", dto);
	}

}
