package controller.booking;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.TicketsDAO;
import model.DTO.TicketElmntsDTO;

public class BookingNext {

	public void execute(HttpServletRequest request) {
			
			String[] choosen = request.getParameterValues("seatNum");
			String seats = "";
			for (int i = 0; i < choosen.length; i++) {
				seats += choosen[i]+",";
			}
			String cctNum = request.getParameter("num");
			String qty = request.getParameter("qty");
			int price = 0;
			TicketsDAO tdao = new TicketsDAO();
			List<TicketElmntsDTO> list = tdao.selChoosen(choosen, cctNum);
			for (int i = 0; i <list.size(); i++) {
				price += list.get(i).getPrice();
			}
			request.setAttribute("totalPrice", price);
			request.setAttribute("seats", seats);
			request.setAttribute("qty", qty);
		}
		
		
		
	}

