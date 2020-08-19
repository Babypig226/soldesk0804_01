package controller.noticeBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.NoticeBoardDAO;
import model.DTO.NoticeBoardDTO;

public class NoticeBoardDelAction {
	public String execute(HttpServletRequest request) {

		String noticeNum = request.getParameter("num");
		HttpSession session = request.getSession();
		String noticeId = (String) session.getAttribute("logId");

		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setNoticeNum(request.getParameter("num"));
		dto.setNoticeId((String) session.getAttribute("logId"));

		NoticeBoardDAO dao = new NoticeBoardDAO();
		dao.notBoardDel(noticeId, noticeNum);

		return dto.getNoticeNum();
	}
}
