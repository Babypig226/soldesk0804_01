package Main.service;

import Main.DTO.MemberDTO;

public class MemberPrinter {

	public void print(MemberDTO memberDTO) {
		System.out.printf("회원정보는 : 아이디 = %d, 이메일 = %s, 이름 = %s, 등록일 = %tF \n", memberDTO.getId(), memberDTO.getEmail(), memberDTO.getName(), memberDTO.getRegisterDate());
		
	}

}
