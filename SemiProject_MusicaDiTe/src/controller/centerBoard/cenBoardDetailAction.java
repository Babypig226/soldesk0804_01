package controller.centerBoard;

import javax.servlet.http.HttpServletRequest;

import model.DAO.CenterBoardDAO;
import model.DTO.CenterBoardDTO;

public class cenBoardDetailAction {
	public void execute(HttpServletRequest request) {
	String boardNum =
			request.getParameter("boardNum");
	CenterBoardDAO dao = new CenterBoardDAO();
	/*
	List<AnswerBoardDTO> list =
			dao.ansSelectAll(1, 1, boardNum);
	request.setAttribute("dto", list.get(0));
	*/
	CenterBoardDTO dto =
			dao.cenSelectAll(1, 1, boardNum).get(0);
	request.setAttribute("dto", dto);
}
}
