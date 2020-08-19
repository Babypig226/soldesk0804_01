package controller.lostBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.LostBoardDAO;
import model.DTO.LostBoardDTO;

public class LostBoardDelAction {
	public void execute(HttpServletRequest request) {

		String boardNum = request.getParameter("boardNum");
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("logId");
		String boardPass = request.getParameter("boardPass");

		LostBoardDTO dto = new LostBoardDTO();
		dto.setBoardNum(Long.parseLong(boardNum));
		dto.setBoardPass(boardPass);
		dto.setUserId(userId);

		LostBoardDAO dao = new LostBoardDAO();
		dao.lostBoardDel(boardPass, userId, boardNum);
	}
}


