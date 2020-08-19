package controller.concerts;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import model.DAO.ArtistsDAO;
import model.DTO.ArtistsSrchDTO;

public class ArtistsSearch {

	public void execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String instrument = request.getParameter("instrument");
		ArtistsDAO dao = new ArtistsDAO();
		ArtistsSrchDTO dto = dao.artistsSearch(instrument);
		request.setAttribute("artists", dto);
		
	}

}
