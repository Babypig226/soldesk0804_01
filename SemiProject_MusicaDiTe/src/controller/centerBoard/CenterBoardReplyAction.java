package controller.centerBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.CenterBoardDAO;
import model.DTO.CenterBoardDTO;

public class CenterBoardReplyAction {
	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		CenterBoardDTO dto = new CenterBoardDTO();
		dto.setCenterContent(request.getParameter("centerContent"));
		dto.setCenterName(request.getParameter("centerName"));
		dto.setCenterPass(request.getParameter("centerPass"));
		dto.setBoardReLev(Long.parseLong(request.getParameter("boardReLev")));
		dto.setBoardReRef(Long.parseLong(request.getParameter("boardReRef")));
		dto.setBoardReSeq(Long.parseLong(request.getParameter("boardReSeq")));
		dto.setCenterSubject(request.getParameter("centerSubject"));
		dto.setIpAddr(request.getRemoteAddr());
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("logId");
		dto.setCenterId(userId);
		CenterBoardDAO dao = new CenterBoardDAO();
		dao.cenSeqUpdate(dto);
		dao.cenReplyInsert(dto);
	}
}
