package controller.ticket;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.TicketsDAO;
import model.DTO.TicketElmntsDTO;

public class TktRegistAction {
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String employeeId = (String)session.getAttribute("logId");
		List<TicketElmntsDTO> list = new ArrayList<TicketElmntsDTO>();
		String[] grades = request.getParameterValues("grade");
		String[] prices = request.getParameterValues("price");
		String[] startRows = request.getParameterValues("beginRow");
		String[] startSeats = request.getParameterValues("beginNum");
		String[] endSeats = request.getParameterValues("endNum");
		for (int i = 0; i < grades.length; i++) {
			int startR =Integer.parseInt(startRows[i]);
			int startS = Integer.parseInt(startSeats[i]);
			int endS = Integer.parseInt(endSeats[i]);
			List<String> seats = new ArrayList<String>();
			TicketElmntsDTO dto = new TicketElmntsDTO();
			dto.setCctNum(Long.parseLong(request.getParameter("num")));
			dto.setEmployeeId(employeeId);
			dto.setGrade(grades[i]);
			dto.setPrice(Integer.parseInt(prices[i]));
			dto.setStartRow(Integer.parseInt(startRows[i]));
			dto.setStartSeat(Integer.parseInt(startSeats[i]));
			dto.setEndSeat(Integer.parseInt(endSeats[i]));
			for (int j = startS; j <= endS; j++) {
				seats.add(startR + ":" + j);
				dto.setSeats(seats);
			}
			list.add(dto);
		}
		TicketsDAO dao = new TicketsDAO();
		dao.setSeats(list);
		
		request.setAttribute("list", list);
		
	}

}
