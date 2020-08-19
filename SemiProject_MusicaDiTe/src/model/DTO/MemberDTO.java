package model.DTO;

import java.sql.Timestamp;

public class MemberDTO {
//	USER_ID        VARCHAR2(20)  
//	USER_PW        VARCHAR2(200) 
//	USER_NAME      VARCHAR2(40)  
//	USER_BIRTH     TIMESTAMP(6)  
//	USER_ADDR      VARCHAR2(500) 
//	USER_PH1       VARCHAR2(20)  
//	USER_PH2       VARCHAR2(20)  
//	USER_EMAIL     VARCHAR2(200) 
//	USER_REGIST    TIMESTAMP(6)  
//	JOIN_OK        VARCHAR2(500) 

	String userId;
	String userPw;
	String userName;
	Timestamp userBirth;
	String userAddr;
	String userEmail;
	String userPh1;
	String userPh2;
	String joinOk;
	Timestamp userRegist;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Timestamp getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Timestamp userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPh1() {
		return userPh1;
	}
	public void setUserPh1(String userPh1) {
		this.userPh1 = userPh1;
	}
	public String getUserPh2() {
		return userPh2;
	}
	public void setUserPh2(String userPh2) {
		this.userPh2 = userPh2;
	}
	public String getJoinOk() {
		return joinOk;
	}

	public void setJoinOk(String joinOk) {
		this.joinOk = joinOk;
	}
	public Timestamp getUserRegist() {
		return userRegist;
	}
	public void setUserRegist(Timestamp userRegist) {
		this.userRegist = userRegist;
	}

	

}
