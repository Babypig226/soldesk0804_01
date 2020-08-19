package controller.concerts;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import model.DAO.ConcertsDAO;
import model.DTO.ConcertsDTO;

public class ContentRead {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String employeeId = (String)session.getAttribute("logId");
		String num = request.getParameter("num");
		ConcertsDAO dao = new ConcertsDAO();
		ConcertsDTO dto = dao.detail(num);
		if(!employeeId.equals("admin")) {
			dao.updateReadCount(num, "concerts");
		}
		request.setAttribute("dto", dto);
		
		
		Timestamp ts = dto.getCctDate();
		Date date = new Date();
		date.setTime(ts.getTime());
		String formattedDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(date);
		request.setAttribute("cctDate", formattedDate);
	}

}
