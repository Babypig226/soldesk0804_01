package service.member;

//import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import command.MemberCommand;
import controller.MailService;
import controller.smsSend;
import model.MemberDTO;
import repository.MemberRepository;
@Service
public class MemberJoinService {
	@Autowired
	MailService mailService;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	MemberRepository memberRepository;
	public Integer execute(MemberCommand memberCommand) {
		Integer result = null;
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserAddr(memberCommand.getUserAddr());
//		Timestamp userBirth = 
//				new Timestamp(
//						memberCommand.getUserBirth().getTime());
		memberDTO.setUserBirth(memberCommand.getUserBirth());
		memberDTO.setUserEmail(memberCommand.getUserEmail());
		memberDTO.setUserGender(memberCommand.getUserGender());
		memberDTO.setUserId(memberCommand.getUserId());
		memberDTO.setUserName(memberCommand.getUserName());
		memberDTO.setUserPh1(memberCommand.getUserPh1());
		memberDTO.setUserPh2(memberCommand.getUserPh2());
		String interest = "";
		for(String iter : memberCommand.getInterest()) {
			interest += iter + "`";
		}
		memberDTO.setInterests(interest);
		memberDTO.setUserPw(bcryptPasswordEncoder.encode(
				memberCommand.getUserPw()));
		result = memberRepository.insertMember(memberDTO);
		if(result != null) {
			try {
				mailService.sendMail(memberDTO.getUserEmail(), memberDTO.getUserId());	
				smsSend ss = new smsSend();
				ss.smsSend(memberDTO.getUserPh1(),memberDTO.getUserName()+"님 회원가입을 축하합니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public Integer numUpdate(String num, String receiver, String userId) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setJoinOk(num);
		memberDTO.setUserEmail(receiver);
		memberDTO.setUserId(userId);
		return memberRepository.joinOkUpdate(memberDTO);
	}
	}
		

