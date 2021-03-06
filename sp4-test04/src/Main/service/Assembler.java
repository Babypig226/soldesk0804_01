package Main.service;

import Main.DTO.MemberDAO;

public class Assembler {
	private MemberDAO memberDao;
	private MemberPrinter printer;
	private MemberRegisterService memberRegisterService;
	private MemberListPrinter memberListPrinter;
	private ChangePasswordService changePasswordService;
	private MemberInfoPrinter memberInfoPrinter;
	
	

	public Assembler() {
		this.memberDao = new MemberDAO();
		this.printer = new MemberPrinter();
		this.memberRegisterService = new MemberRegisterService(memberDao);
		this.memberListPrinter = new MemberListPrinter(memberDao, printer);
		this.changePasswordService = new ChangePasswordService();
		this.memberInfoPrinter = new MemberInfoPrinter();
	}
	
	public MemberDAO getMemberDAO() {
		return memberDao;
	}
	public MemberPrinter getPrinter() {
		return printer;
	}
	
	public MemberRegisterService getMemberRegisterService() {
		return memberRegisterService;
	}
	
	public MemberListPrinter getMemberListPrinter() {
		return memberListPrinter;
	}
	
	public ChangePasswordService getChangePasswordService() {
		changePasswordService.setDao(memberDao);
		return changePasswordService;
	}
	
	public MemberInfoPrinter getMemberInfoPrinter() {
		memberInfoPrinter.setMemberDAO(memberDao);
		memberInfoPrinter.setPrinter(printer);
		return memberInfoPrinter;
	}
}
