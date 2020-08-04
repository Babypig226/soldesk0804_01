package Main.service;

import Main.DTO.MemberDAO;
import Main.DTO.MemberDTO;

public class MemberInfoPrinter {
	private MemberDAO memberDao;
	private MemberPrinter printer;
	//의존객체 주입 Dependency Injection. setter이용
	public void setMemberDAO(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	public void setPrinter(MemberPrinter printer) {
		this.printer = printer;
	}
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
