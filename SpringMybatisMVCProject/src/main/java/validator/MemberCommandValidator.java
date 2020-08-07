package validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.MemberCommand;

//유효성검사
public class MemberCommandValidator implements Validator{
	private static final String emailRegExp = "^[_A-Za-z0-9-]+(.[_A-Za-z0-9]+)*@(?:\\w+\\.)+\\w+$";
	private Pattern pattern;
	public MemberCommandValidator() {
		pattern = Pattern.compile(emailRegExp);
	}
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberCommand.class.isAssignableFrom(clazz);
	}
	@Override
		public void validate(Object target, Errors errors) {
		MemberCommand reqReq = (MemberCommand)target;
		if(reqReq.getUserEmail() == null || reqReq.getUserEmail().trim().isEmpty()) {
			errors.rejectValue("userEmail", "required");
		}else {
			Matcher matcher = pattern.matcher(reqReq.getUserEmail());
			if(!matcher.matches()) {
				errors.rejectValue("userEmail", "bad");
			}
		}
		if(!reqReq.getUserPw().isEmpty()) {
			if(!reqReq.isUserPwEqualToUserPwCon()) {
				errors.rejectValue("userPwCon", "nomatch");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "required");
		ValidationUtils.rejectIfEmpty(errors, "userId", "required");
		ValidationUtils.rejectIfEmpty(errors, "userPw", "required");
		ValidationUtils.rejectIfEmpty(errors, "userPwCon", "required");
		ValidationUtils.rejectIfEmpty(errors, "userPh1", "required");
		ValidationUtils.rejectIfEmpty(errors, "userAddr", "required");
		ValidationUtils.rejectIfEmpty(errors, "userBirth", "required");
	}
}
