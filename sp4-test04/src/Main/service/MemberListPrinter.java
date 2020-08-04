package Main.service;

import java.util.Collection;

import Main.DTO.MemberDAO;
import Main.DTO.MemberDTO;

public class MemberListPrinter {
	//의존객체
	private MemberDAO memberDao;	
	private MemberPrinter printer;
	//의존객체 주입: Dependency Injection 생성자 이용
	public MemberListPrinter(MemberDAO memberDao, MemberPrinter printer) {
		this.memberDao = memberDao;
		this.printer = printer;
	}
	
	public void printAll() {
		Collection<MemberDTO> lists = memberDao.selectAll();
		System.out.println("총 회원 수는 : " + lists.size());
		for (MemberDTO memberDTO : lists) {
			printer.print(memberDTO);
		}
		
	}
	

}
