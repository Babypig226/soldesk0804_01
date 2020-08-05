package sp4.sp4_test06_service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sp4.sp4_test06_DTO.MemberDAO;
import sp4.sp4_test06_DTO.MemberDTO;
import sp4.sp4_test06_DTO.RegisterRequest;
@Service
public class MemberRegisterService {
	@Autowired
	private MemberDAO memberDao;
	public void regist(RegisterRequest req) {
		MemberDTO dto = memberDao.selectByEmail(req.getEmail());
		if(dto == null) {
			dto = new MemberDTO();
			dto.setEmail(req.getEmail());
			dto.setName(req.getName());
			dto.setPassword(req.getPassword());
			dto.setRegisterDate(new Date());
			memberDao.insert(dto);			
			System.out.println("사용자 등록이 완료되었습니다.");
		} else {
			System.out.println("중복 사용자입니다.");
		}
	}
}
