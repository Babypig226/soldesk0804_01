package controller.noticeBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.NoticeBoardDAO;
import model.DTO.NoticeBoardDTO;

public class NoticeListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;

		NoticeBoardDAO dao = new NoticeBoardDAO();
		String num = null;
		List<NoticeBoardDTO> list = dao.noticeSelectAll(page, limit, num );
		Integer count = dao.noticeCount();

		request.setAttribute("list", list);
		request.setAttribute("count", count);

		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "notBoardList.not?");
	}
}
