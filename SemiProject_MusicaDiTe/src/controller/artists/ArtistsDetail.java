package controller.artists;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ArtistsDAO;
import model.DTO.ArtistsDTO;

public class ArtistsDetail {

	public void execute(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		String artRegNum = request.getParameter("num");
		ArtistsDAO dao = new ArtistsDAO();
		if(!userId.equals("admin")) {
			dao.updateReadCount(artRegNum, "artists");
		}
		ArtistsDTO dto = dao.selFdetail(artRegNum);
		request.setAttribute("artInfo", dto);
		
		
	}

}
