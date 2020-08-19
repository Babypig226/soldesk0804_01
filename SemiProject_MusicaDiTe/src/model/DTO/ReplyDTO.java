package model.DTO;

import java.sql.Timestamp;

public class ReplyDTO {
	private Long eventNo;
	private String euserId;
	private Long replyNo;
	private String ruserId;
	private String replyContent;
	private Timestamp regDate;

	public Long getEventNo() {
		return eventNo;
	}

	public void setEventNo(Long eventNo) {
		this.eventNo = eventNo;
	}

	public String getEuserId() {
		return euserId;
	}

	public void setEuserId(String euserId) {
		this.euserId = euserId;
	}

	public Long getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(Long replyNo) {
		this.replyNo = replyNo;
	}

	public String getRuserId() {
		return ruserId;
	}

	public void setRuserId(String ruserId) {
		this.ruserId = ruserId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

}
