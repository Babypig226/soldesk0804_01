package controller.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;

public class MemberInfoCngAction {
	public Integer execute(HttpServletRequest request) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Integer i = 0;
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("logId");
		String userPw = request.getParameter("userPw");
		MemberDAO dao = new MemberDAO();
		i = dao.memberLoginCk(userId, userPw);
		return i;
	}
}
