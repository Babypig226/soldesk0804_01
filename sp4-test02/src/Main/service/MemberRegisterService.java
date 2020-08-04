package Main.service;

import java.util.Date;

import Main.DTO.MemberDAO;
import Main.DTO.MemberDTO;
import Main.DTO.RegisterRequest;

public class MemberRegisterService {
	//의존객체 Dependency Object DTO는 의존객체로 사용하지 않음  무조건 생성이 필요한 객체만 의존객체. 때에 따라 생성여부가 달라지는 경우 의존객체가 아니
	private MemberDAO memberDao = new MemberDAO();
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
