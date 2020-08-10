package service.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import command.MemberCommand;
import model.AuthInfo;
import model.MemberDTO;
import model.StartEndPageDTO;
import repository.MemberRepository;

@Service
public class MemberPasswordService {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	public void execute(MemberCommand memberCommand, Model model, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		MemberDTO dto = new MemberDTO();
		dto.setUserId(authInfo.getUserId());
		dto.setUserEmail(authInfo.getUserEmail());
		dto.setStartEndPageDTO(new StartEndPageDTO());
		dto.getStartEndPageDTO().setStartPage(1L);
		dto.getStartEndPageDTO().setEndPage(1L);
		MemberDTO member = memberRepository.selectByMember(dto);
		if(bCryptPasswordEncoder.matches(memberCommand.getOldPw(), member.getUserPw())) {
			dto.setUserPw(bCryptPasswordEncoder.encode(memberCommand.getUserPw()));
			memberRepository.passwordUpdate(dto);
			model.addAttribute("userId", authInfo.getUserId());
		}
		
	}

}
