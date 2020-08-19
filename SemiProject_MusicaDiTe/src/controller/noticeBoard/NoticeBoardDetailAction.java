package controller.noticeBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.NoticeBoardDAO;
import model.DTO.NoticeBoardDTO;

public class NoticeBoardDetailAction {
	public void execute(HttpServletRequest request) {
		String num = request.getParameter("num");
		NoticeBoardDAO dao = new NoticeBoardDAO();
		dao.updateReadCount(num, "notice");
		List<NoticeBoardDTO> list = dao.noticeSelectAll(1, 1, num);
		request.setAttribute("list", list);
	}
}
