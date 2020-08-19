package controller.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;

public class PwModifyProAction {
	public Integer execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("logId");
		String userPw = request.getParameter("pw");
		String newPw = request.getParameter("newPw");
		MemberDAO dao = new MemberDAO();
		Integer i = dao.passUpdate(userId, userPw, newPw);
		return i;
	}

}
