package Main.service;

import Main.DTO.MemberDAO;
import Main.DTO.MemberDTO;

public class ChangePasswordService {
	private MemberDAO dao = new MemberDAO();
	
	public void changePw(String email, String oldPw, String newPw) {
		MemberDTO dto = dao.selectByEmail(email);
		if(dto == null) {
			System.out.println("이메일이 존재하지 않습니다.");
			return;
		}else {
			dto.changePassword(oldPw, newPw);
			dao.update(dto);
			System.out.println("비밀번호가 변경되었습니다.");
			
		}
		
	}

}
