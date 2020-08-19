package controller.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import model.DAO.MemberDAO;

public class MemberJoinOkAction {
	public String execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String path = null;
		String email = request.getParameter("email");
		System.out.println(email);
		String joinOk = request.getParameter("joinOk");
		System.out.println(joinOk);
		MemberDAO dao = new MemberDAO();
		Integer i = dao.joinOkUPdate(email, joinOk);
		if (i == 1) {
			path = "/member/success.html";
		} else {
			path = "/member/fail.jsp";
		}
		return path;
	}
}
