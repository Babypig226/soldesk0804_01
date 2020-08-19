package controller.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;

public class PwModifyAction {
	public Integer execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("logId");
		String userPw = request.getParameter("userPw");
		System.out.println(userId);
		MemberDAO dao = new MemberDAO();
		int i = dao.memberLoginCk(userId, userPw);
		return i;
	}
}
