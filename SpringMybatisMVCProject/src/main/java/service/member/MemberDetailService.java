package service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import model.MemberDTO;
import model.StartEndPageDTO;
import repository.MemberRepository;

public class MemberDetailService {
	@Autowired
	MemberRepository memberRepository;
	public void memberDetail(String userId, Model model) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setStartEndPageDTO(new StartEndPageDTO());
		memberDTO.getStartEndPageDTO().setEndPage(1L);
		memberDTO.getStartEndPageDTO().setStartPage(1L);
		memberDTO.setUserId(userId);
		List<MemberDTO> list= memberRepository.getMemberList(memberDTO);
		model.addAttribute("memberCommand", list.get(0));
	}

}
