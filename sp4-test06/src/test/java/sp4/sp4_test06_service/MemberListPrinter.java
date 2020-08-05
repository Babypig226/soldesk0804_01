package sp4.sp4_test06_service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sp4.sp4_test06_DTO.MemberDAO;
import sp4.sp4_test06_DTO.MemberDTO;
@Service
public class MemberListPrinter {
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private MemberPrinter printer;

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
