package controller.auditionNotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.AuditionNoticeDAO;
import model.DTO.AuditionNoticeDTO;

public class ANSel {

	public void execute(HttpServletRequest request) {
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("logId");
		
			String auditionNoticeNum = request.getParameter("num");
			AuditionNoticeDAO dao = new AuditionNoticeDAO();
			if(!userId.equals("admin")) {
				dao.updateReadCount(auditionNoticeNum, "audition_notice");				
			}
			AuditionNoticeDTO dto = dao.anSelOne(auditionNoticeNum);
			request.setAttribute("dto", dto);
	}

}
