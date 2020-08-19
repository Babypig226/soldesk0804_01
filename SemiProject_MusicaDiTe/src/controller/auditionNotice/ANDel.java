package controller.auditionNotice;

import javax.servlet.http.HttpServletRequest;

import model.DAO.AuditionNoticeDAO;
//import javax.servlet.http.HttpSession;

public class ANDel {
	public void execute(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		String employeeId = (String)session.getAttribute("");
		AuditionNoticeDAO dao = new AuditionNoticeDAO();
		dao.anDel(request.getParameter("num"));
		
	}

}
