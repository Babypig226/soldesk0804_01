package controller.eventBoard;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.EventBoardDAO;
import model.DTO.ReplyDTO;

public class ReplyInsertAction {
	public void execute(HttpServletRequest request) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String euserId = request.getParameter("euserId");
		String eventNo = request.getParameter("eventNo");
		String replyContent = request.getParameter("replyContent");

		ReplyDTO dto = new ReplyDTO();
		dto.setEventNo(Long.parseLong(eventNo));
		dto.setEuserId(euserId);
		dto.setReplyContent(replyContent);

		HttpSession session = request.getSession();
		dto.setRuserId((String) session.getAttribute("logId"));

		EventBoardDAO dao = new EventBoardDAO();
		dao.replyInsert(dto);

	}

}
