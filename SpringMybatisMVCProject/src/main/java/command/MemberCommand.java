package command;

//import java.sql.Date;
//import java.time.LocalDateTime;

//import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberCommand {
		String userId;
		String oldPw;
	   String userPw;
	   String userPwCon;
	   String userName;
//	   @DateTimeFormat(pattern="yyyy-MM-dd")
//	   @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
//	   LocalDateTime userBirth;
	   String userBirth;
	   String userGender;
	   String userEmail;
	   String userAddr;
	   String userPh1;
	   String userPh2;
	   String [] interest;
	   public boolean isUserPwEqualToUserPwCon() {
	      if(userPw.equals(userPwCon)) {
	         return true;
	      }
	      return false;
	   }
	
	
}
