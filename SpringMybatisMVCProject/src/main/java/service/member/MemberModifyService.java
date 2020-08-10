package service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import command.MemberCommand;
import model.MemberDTO;
import model.StartEndPageDTO;
import repository.MemberRepository;

@Service
public class MemberModifyService {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	public String memberUpdate(MemberCommand memberCommand, Errors errors) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId(memberCommand.getUserId());
		memberDTO.setUserAddr(memberCommand.getUserAddr());
		memberDTO.setUserEmail(memberCommand.getUserEmail());
		memberDTO.setUserPh1(memberCommand.getUserPh1());
		memberDTO.setUserPh2(memberCommand.getUserPh2());
		memberDTO.setStartEndPageDTO(new StartEndPageDTO());
		memberDTO.getStartEndPageDTO().setStartPage(1L);
		memberDTO.getStartEndPageDTO().setEndPage(1L);
		
		MemberDTO member = memberRepository.selectByMember(memberDTO);
		if(bcryptPasswordEncoder.matches(memberCommand.getUserPw(), member.getUserPw())) {
			memberRepository.memberUpdate(memberDTO);
			return "redirect:/mem/memberInfo/"+memberCommand.getUserId();
		}else {
			errors.rejectValue("userPw", "wrong");
			return "member/memberModify";
		}
	}

}
