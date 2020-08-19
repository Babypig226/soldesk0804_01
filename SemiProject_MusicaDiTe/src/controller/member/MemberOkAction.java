package controller.member;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import controller.MailAction;
import model.DAO.MemberDAO;
import model.DTO.MemberDTO;

public class MemberOkAction {
	public void execute(HttpServletRequest request) {

//		USER_ID        VARCHAR2(20)  
//		USER_PW        VARCHAR2(200) 
//		USER_NAME      VARCHAR2(40)  
//		USER_BIRTH     TIMESTAMP(6)  
//		USER_ADDR      VARCHAR2(500) 
//		USER_PH1       VARCHAR2(20)  
//		USER_PH2       VARCHAR2(20)  
//		USER_EMAIL     VARCHAR2(200) 
//		USER_REGIST    TIMESTAMP(6)  
//		JOIN_OK        VARCHAR2(500) 

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userBir = request.getParameter("userBirth");
		userBir = userBir.replace("T", " ");
		String userAddr = request.getParameter("userAddr");
		String userPh1 = request.getParameter("userPh1");
		String userPh2 = request.getParameter("userPh2");
		String userEmail = request.getParameter("userEmail");

		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		Date date = null;

		try {
			date = dt.parse(userBir);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp userBirth = new Timestamp(date.getTime());
		System.out.println(userBirth);

		MemberDTO dto = new MemberDTO();

		dto.setUserAddr(userAddr);
		dto.setUserBirth(userBirth);
		dto.setUserEmail(userEmail);
		dto.setUserId(userId);
		dto.setUserName(userName);
		dto.setUserPh1(userPh1);
		dto.setUserPh2(userPh2);
		dto.setUserPw(userPw);

		MemberDAO dao = new MemberDAO();
		Integer i = dao.memberInsert(dto);
		if (i != null) {
			MailAction mail = new MailAction();
			mail.sendMail(dto);
		}
	}
}
