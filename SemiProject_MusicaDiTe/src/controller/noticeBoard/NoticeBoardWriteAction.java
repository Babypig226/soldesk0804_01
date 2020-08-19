package controller.noticeBoard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.NoticeBoardDAO;
import model.DTO.NoticeBoardDTO;

public class NoticeBoardWriteAction {
	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setNoticeName(request.getParameter("noticeName"));
		dto.setNoticeSubject(request.getParameter("noticeSubject"));
		dto.setNoticeContent(request.getParameter("noticeContent"));

		HttpSession session = request.getSession();
		dto.setNoticeId((String) session.getAttribute("logId"));

		NoticeBoardDAO dao = new NoticeBoardDAO();
		dao.noticeInsert(dto);

	}
}
