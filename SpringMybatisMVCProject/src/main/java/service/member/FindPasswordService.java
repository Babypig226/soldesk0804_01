package service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.MemberCommand;
import controller.MailService;
import controller.RamdomPassword;
import model.MemberDTO;
import model.StartEndPageDTO;
import repository.MemberRepository;

@Service
public class FindPasswordService {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	MailService mailService;
	public String findPass(MemberCommand memberCommand, Model model) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserEmail(memberCommand.getUserEmail());
		memberDTO.setUserId(memberCommand.getUserId());
		memberDTO.setStartEndPageDTO(new StartEndPageDTO());
		memberDTO.getStartEndPageDTO().setStartPage(1L);
		memberDTO.getStartEndPageDTO().setEndPage(1L);
		MemberDTO member = memberRepository.selectByMember(memberDTO);
		if(member != null) {
			String pass = RamdomPassword.getRamdomPassword(10);
			String newPw = bCryptPasswordEncoder.encode(pass);
			memberDTO.setUserPw(newPw);
			memberRepository.passwordUpdate(memberDTO);
			String content = member.getUserName() + "님, 임시비밀번호는 "+pass + "입니다. <br/> 로그인 후 비밀번호를 변경해주시기 바랍니다.";
			String subject = "임시비밀번호 안내";
			try {
				mailService.sendMail(memberDTO.getUserEmail(), memberDTO.getUserId(), content, subject);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("member", member);
			return "member/passView";
		}else {
			model.addAttribute("err", "이메일이나 아이디가 잘못되었습니다.");
			return "member/findPassword";
		}
		
	}
	

}
