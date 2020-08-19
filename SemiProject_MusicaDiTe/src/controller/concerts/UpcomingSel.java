package controller.concerts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.ConcertsDAO;
import model.DTO.ConcertsDTO;

public class UpcomingSel {
	public void execute(HttpServletRequest request) {
		
		ConcertsDAO dao = new ConcertsDAO();
		List<ConcertsDTO> list = dao.upcomingConcert();
		request.setAttribute("dto", list);
	}
}
