package model.DTO;

import java.sql.Timestamp;

public class AuditionNoticeDTO {
	Integer auditionNoticeNum;
	String auditionNoticeTitle;
	String auditionNoticeApperiod;
	String auditionNoticeLocation;
	int auditionNoticeSelnum;
	String auditionNoticeCategory;
	String employeeId;
	Timestamp regDate;
	Long readCount;
	String auditionDate;
	String auditionContent;
	String applyCondition;
	String image;
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	public String getAuditionDate() {
		return auditionDate;
	}
	public void setAuditionDate(String auditionDate) {
		this.auditionDate = auditionDate;
	}
	public String getAuditionContent() {
		return auditionContent;
	}
	public void setAuditionContent(String auditionContent) {
		this.auditionContent = auditionContent;
	}
	public String getApplyCondition() {
		return applyCondition;
	}
	public void setApplyCondition(String applyCondition) {
		this.applyCondition = applyCondition;
	}
	public Integer getAuditionNoticeNum() {
		return auditionNoticeNum;
	}
	public void setAuditionNoticeNum(Integer auditionNoticeNum) {
		this.auditionNoticeNum = auditionNoticeNum;
	}
	public String getAuditionNoticeTitle() {
		return auditionNoticeTitle;
	}
	public void setAuditionNoticeTitle(String auditionNoticeTitle) {
		this.auditionNoticeTitle = auditionNoticeTitle;
	}
	public String getAuditionNoticeApperiod() {
		return auditionNoticeApperiod;
	}
	public void setAuditionNoticeApperiod(String auditionNoticeApperiod) {
		this.auditionNoticeApperiod = auditionNoticeApperiod;
	}
	public String getAuditionNoticeLocation() {
		return auditionNoticeLocation;
	}
	public void setAuditionNoticeLocation(String auditionNoticeLocation) {
		this.auditionNoticeLocation = auditionNoticeLocation;
	}
	public int getAuditionNoticeSelnum() {
		return auditionNoticeSelnum;
	}
	public void setAuditionNoticeSelnum(int auditionNoticeSelnum) {
		this.auditionNoticeSelnum = auditionNoticeSelnum;
	}
	public String getAuditionNoticeCategory() {
		return auditionNoticeCategory;
	}
	public void setAuditionNoticeCategory(String auditionNoticeCategory) {
		this.auditionNoticeCategory = auditionNoticeCategory;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Long getReadCount() {
		return readCount;
	}
	public void setReadCount(Long readCount) {
		this.readCount = readCount;
	}
	

}
