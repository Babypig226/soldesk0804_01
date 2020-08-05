package sp4.sp4_test06_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sp4.sp4_test06_DTO.MemberDAO;
import sp4.sp4_test06_DTO.MemberDTO;
@Service
public class ChangePasswordService {
	@Autowired
	private MemberDAO dao;
	
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
