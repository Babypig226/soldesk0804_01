package sp4.sp4_test06_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sp4.sp4_test06_DTO.MemberDAO;
import sp4.sp4_test06_DTO.MemberDTO;
@Service
public class MemberInfoPrinter {
	@Autowired //setter를 통한 의존객체 주입
	private MemberDAO memberDao;
	@Autowired
	private MemberPrinter printer;
	
	public void printMemberInfo(String email) {
		MemberDTO memberDto = memberDao.selectByEmail(email);
		if(memberDto == null) {
			System.out.println("해당 데이터의 사용자는 존재하지 않습니다.");
			return;
		}else {
			printer.print(memberDto);
		}
	}

}
