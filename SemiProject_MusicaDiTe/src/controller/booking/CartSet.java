package controller.booking;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.PurchaseDAO;
import model.DAO.TicketsDAO;
import model.DTO.PurchaseDTO;

public class CartSet {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		String seats = request.getParameter("seats");
		String cctNum = request.getParameter("num");
		String[] seat = seats.split(",");
		TicketsDAO dao = new TicketsDAO();
		dao.qtyUpdate(seat, cctNum);
		int qty = seat.length;
		String totalPrice = request.getParameter("totalPrice");
		PurchaseDTO dto = new PurchaseDTO();
		dto.setUserId(userId);
		dto.setCctNum(Long.parseLong(cctNum));
		dto.setTotalPrice(Integer.parseInt(totalPrice));
		dto.setSeats(seats);
		dto.setQty(qty);
		PurchaseDAO pcl = new PurchaseDAO();
		pcl.setPcList(dto);
		
		
	}

}
