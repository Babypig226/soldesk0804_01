package sp4.sp4_test06_service;

import sp4.sp4_test06_DTO.MemberDTO;

public class MemberPrinter {

	public void print(MemberDTO memberDTO) {
		System.out.printf("회원정보는 : 아이디 = %d, 이메일 = %s, 이름 = %s, 등록일 = %tF \n", memberDTO.getId(), memberDTO.getEmail(), memberDTO.getName(), memberDTO.getRegisterDate());
		
	}

}
