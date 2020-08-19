package controller.booking;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.PurchaseDAO;
import model.DTO.PurchaseDTO;

public class CartRead {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		PurchaseDAO dao = new PurchaseDAO();
		List<PurchaseDTO> list = dao.selectAll(userId);
		request.setAttribute("list", list);
		
	}

}
