package service.member;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import command.MemberCommand;
import model.MemberDTO;

public class MemberJoinService {
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	public Integer execute(MemberCommand memberCommand) {
		Integer result = null;
		MemberDTO memberDto = new MemberDTO();
		memberDto.setUserId(memberCommand.getUserId());
		memberDto.setUserName(memberCommand.getUserName());
		Timestamp userBirth = new Timestamp(memberCommand.getUserBirth().getTime());
		memberDto.setUserBirth(userBirth);
		memberDto.setUserGender(memberCommand.getUserGender());
		memberDto.setUserEmail(memberCommand.getUserEmail());
		memberDto.setUserAddr(memberCommand.getUserAddr());
		memberDto.setUserPh1(memberCommand.getUserPh1());
		memberDto.setUserPh2(memberCommand.getUserPh2());
		String interests = "";
		for (String str : memberCommand.getInterests()) {
			interests += str + "`";
		}
		memberDto.setInterests(interests);
		memberDto.setUserPw(bcryptPasswordEncoder.encode(memberCommand.getUserPw()));
		System.out.println(memberCommand.getUserPw());
		System.out.println(memberDto.getUserPw());
		return result;
	}

}
