package controller.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;

public class MemberConfirmAction {
	public void execute(HttpServletRequest request) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String userId = request.getParameter("userId");
		MemberDAO dao = new MemberDAO();
		String confirmId = dao.memberConfirm(userId);
		request.setAttribute("userId", userId);
		request.setAttribute("confirmId", confirmId);
	}
}
