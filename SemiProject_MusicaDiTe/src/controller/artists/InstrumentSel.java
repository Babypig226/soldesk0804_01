package controller.artists;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.ArtistsDAO;
import model.DTO.ArtistsDTO;

public class InstrumentSel {

	public void execute(HttpServletRequest request) {
		String instrument = request.getParameter("instrument");
		ArtistsDAO dao = new ArtistsDAO();
		List<ArtistsDTO> list = dao.selByInstrument(instrument);
		request.setAttribute("artList", list);
		
	}

}
