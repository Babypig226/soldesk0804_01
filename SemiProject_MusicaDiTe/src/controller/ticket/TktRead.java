package controller.ticket;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.ConcertsDAO;
import model.DAO.TicketsDAO;
import model.DTO.ConcertsDTO;
import model.DTO.TicketElmntsDTO;

public class TktRead {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String employeeId = (String)session.getAttribute("logId");
		String num = request.getParameter("num");
		ConcertsDAO cdao = new ConcertsDAO();
		ConcertsDTO cdto = cdao.detail(num);
		TicketsDAO tdao = new TicketsDAO();
		List<TicketElmntsDTO> tdto = tdao.ticketInfo(num);
		List<TicketElmntsDTO> qty = tdao.ticketQty(num);
		request.setAttribute("qty", qty);
		request.setAttribute("list", tdto);
		request.setAttribute("dto", cdto);
		
	}

}
