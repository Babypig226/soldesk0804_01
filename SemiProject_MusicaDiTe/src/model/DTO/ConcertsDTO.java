package model.DTO;

import java.sql.Timestamp;

public class ConcertsDTO {
	Long cctNum;
	String employeeId;
	String cctTitle;
	Timestamp cctDate;
	String cctLocation;
	String instrument;
	String artName;
	String cctContent;
	String orgPoster;
	String strPoster;
	String orgDetail;
	String strDetail;
	String cctProgram;
	Long artRegNum;
	Timestamp regDate;
	String ipAddr;
	Long readCount;
	String tktVal;
	
	
	
	public String getTktVal() {
		return tktVal;
	}
	public void setTktVal(String tktVal) {
		this.tktVal = tktVal;
	}
	public Long getReadCount() {
		return readCount;
	}
	public void setReadCount(Long readCount) {
		this.readCount = readCount;
	}

	public String getInstrument() {
		return instrument;
	}
	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}
	public String getArtName() {
		return artName;
	}
	public void setArtName(String artName) {
		this.artName = artName;
	}
	public Long getCctNum() {
		return cctNum;
	}
	public void setCctNum(Long cctNum) {
		this.cctNum = cctNum;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getCctTitle() {
		return cctTitle;
	}
	public void setCctTitle(String cctTitle) {
		this.cctTitle = cctTitle;
	}
	public Timestamp getCctDate() {
		return cctDate;
	}
	public void setCctDate(Timestamp cctDate) {
		this.cctDate = cctDate;
	}
	public String getCctLocation() {
		return cctLocation;
	}
	public void setCctLocation(String cctLocation) {
		this.cctLocation = cctLocation;
	}
	public String getCctContent() {
		return cctContent;
	}
	public void setCctContent(String cctContent) {
		this.cctContent = cctContent;
	}
	public String getOrgPoster() {
		return orgPoster;
	}
	public void setOrgPoster(String orgPoster) {
		this.orgPoster = orgPoster;
	}
	public String getStrPoster() {
		return strPoster;
	}
	public void setStrPoster(String strPoster) {
		this.strPoster = strPoster;
	}
	public String getOrgDetail() {
		return orgDetail;
	}
	public void setOrgDetail(String orgDetail) {
		this.orgDetail = orgDetail;
	}
	public String getStrDetail() {
		return strDetail;
	}
	public void setStrDetail(String strDetail) {
		this.strDetail = strDetail;
	}
	public String getCctProgram() {
		return cctProgram;
	}
	public void setCctProgram(String cctProgram) {
		this.cctProgram = cctProgram;
	}
	public Long getArtRegNum() {
		return artRegNum;
	}
	public void setArtRegNum(Long artRegNum) {
		this.artRegNum = artRegNum;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	
	

}
