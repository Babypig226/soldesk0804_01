package controller.noticeBoard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.NoticeBoardDAO;
import model.DTO.NoticeBoardDTO;

public class NoticeBoardModifyAction {
	public String execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		String noticeId = (String) session.getAttribute("logId");

		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setNoticeNum(request.getParameter("num"));
		System.out.println("noticeNum : " + request.getParameter("num"));
		dto.setNoticeSubject(request.getParameter("noticeSubject"));
		dto.setNoticeContent(request.getParameter("noticeContent"));
		dto.setNoticeId((String) session.getAttribute("logId"));
		NoticeBoardDAO dao = new NoticeBoardDAO();
		dao.noticeUpdate(dto);
		return dto.getNoticeNum();

		// return noticeNum;
	}

}
