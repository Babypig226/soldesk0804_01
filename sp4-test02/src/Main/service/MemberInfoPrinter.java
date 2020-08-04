package Main.service;

import Main.DTO.MemberDAO;
import Main.DTO.MemberDTO;

public class MemberInfoPrinter {
	private MemberDAO memberDao = new MemberDAO();
	private MemberPrinter printer = new MemberPrinter();
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
