package model.DTO;

import java.sql.Timestamp;

public class EventBoardDTO {
	private Long eventNo;
	private String euserId;
	private Timestamp regDate;
	private String eventSubject;
	private String eventContent;

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

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getEventSubject() {
		return eventSubject;
	}

	public void setEventSubject(String eventSubject) {
		this.eventSubject = eventSubject;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

}
