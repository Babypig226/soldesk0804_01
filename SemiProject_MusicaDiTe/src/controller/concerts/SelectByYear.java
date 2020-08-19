package controller.concerts;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.ConcertsDAO;
import model.DTO.ConcertsDTO;

public class SelectByYear {

	public void execute(HttpServletRequest request) {
		int year = Integer.parseInt(request.getParameter("year"));
		String yearBefore = Integer.toString(year -1);
		String cctYear = Integer.toString(year);
		 ConcertsDAO dao = new ConcertsDAO();
		 List<ConcertsDTO> list = dao.selectByYear(cctYear, yearBefore);
		 request.setAttribute("dto", list);
		
	}

}
