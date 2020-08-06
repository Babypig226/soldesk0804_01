package command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberCommand {
	String userId;
	String userPw;
	String userPwCon;
	String userName;
	Date userBirth;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	//@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	String userGender;
	String userEmail;
	String userAddr;
	String userPh1;
	String userPh2;
	String[] interests; 
	
	public boolean isUserPwEqualToUserPwCon() {
		if(userPw.contentEquals(userPwCon)) {
			return true;
		}
		return false;
	}

}
