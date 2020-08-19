package controller.artists;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.ArtistsDAO;
import model.DTO.ArtistsDTO;

public class ArtistsList {

	public void execute(HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		ArtistsDAO dao = new ArtistsDAO();
		List<ArtistsDTO> list = dao.selflist();
		Integer count = dao.countArtists();
		request.setAttribute("artList", list);
		request.setAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "artsList.arts?");

	}

}
