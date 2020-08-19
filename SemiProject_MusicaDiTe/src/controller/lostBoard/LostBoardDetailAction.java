package controller.lostBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.LostBoardDAO;
import model.DTO.LostBoardDTO;

public class LostBoardDetailAction {
	public void execute(HttpServletRequest request) {
		String num = request.getParameter("num");
		LostBoardDAO dao = new LostBoardDAO();
		dao.updateReadCount(num, "lostboard");
		List<LostBoardDTO> list = dao.lostSelectAll(1, 1, num);
		request.setAttribute("list", list);
	}
}
