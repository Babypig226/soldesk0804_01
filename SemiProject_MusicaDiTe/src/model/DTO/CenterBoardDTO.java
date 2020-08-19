package model.DTO;

import java.sql.Timestamp;

public class CenterBoardDTO {
	Long boardNum;
	String centerId;
	String centerName;
	String centerPass;
	String centerSubject;
	String centerContent;
	Timestamp centerDate;
	String ipAddr;
	Long readCount;
	String originalFileName;
	String storeFileName;
	Long fileSize;
	Long boardReRef;
	Long boardReLev;
	Long boardReSeq;
	public Long getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Long boardNum) {
		this.boardNum = boardNum;
	}
	public String getCenterId() {
		return centerId;
	}
	public void setCenterId(String centerId) {
		this.centerId = centerId;
	}
	public String getCenterName() {
		return centerName;
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	public String getCenterPass() {
		return centerPass;
	}
	public void setCenterPass(String centerPass) {
		this.centerPass = centerPass;
	}
	public String getCenterSubject() {
		return centerSubject;
	}
	public void setCenterSubject(String centerSubject) {
		this.centerSubject = centerSubject;
	}
	public String getCenterContent() {
		return centerContent;
	}
	public void setCenterContent(String centerContent) {
		this.centerContent = centerContent;
	}
	public Timestamp getCenterDate() {
		return centerDate;
	}
	public void setCenterDate(Timestamp centerDate) {
		this.centerDate = centerDate;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public Long getReadCount() {
		return readCount;
	}
	public void setReadCount(Long readCount) {
		this.readCount = readCount;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoreFileName() {
		return storeFileName;
	}
	public void setStoreFileName(String storeFileName) {
		this.storeFileName = storeFileName;
	}
	public Long getFileSize() {
		return fileSize;
	}
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	public Long getBoardReRef() {
		return boardReRef;
	}
	public void setBoardReRef(Long boardReRef) {
		this.boardReRef = boardReRef;
	}
	public Long getBoardReLev() {
		return boardReLev;
	}
	public void setBoardReLev(Long boardReLev) {
		this.boardReLev = boardReLev;
	}
	public Long getBoardReSeq() {
		return boardReSeq;
	}
	public void setBoardReSeq(Long boardReSeq) {
		this.boardReSeq = boardReSeq;
	}

}
