package controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.MemberCommand;
import service.member.MemberJoinService;

@Controller
@RequestMapping("register")
public class MemberController {
	MemberJoinService memberJoinService;
	@RequestMapping("agree")
	public String agree(){
		return "member/agree";
	}
	@RequestMapping("regist")
	public String regist(@RequestParam(value="agree", defaultValue = "false") Boolean agree) {
		if(!agree) {
			return "member/agree";
		}else {			
			return "member/memberForm";
		}
	}
	@RequestMapping(value = "memberJoin", method = RequestMethod.POST)
	public String memberJoin(MemberCommand memberCommand, Errors errors, Model model) {
		if(errors.hasErrors()) {
			model.addAttribute("err", "날짜형식이 맞지 않습니다.");
			return "member/memberForm";
		}
		//중복확인
		Integer i =  memberJoinService.execute(memberCommand);
		return "member/memberWelcome";
	}

}
