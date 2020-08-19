package controller.member;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberChk {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.select(userId);
		Timestamp ts = dto.getUserBirth();
		Date date = new Date();
		date.setTime(ts.getTime());
		String userBirth = new SimpleDateFormat("yyMMdd").format(date);
		request.setAttribute("chkBirth", userBirth);
		request.setAttribute("user", dto);
		
	}

}
