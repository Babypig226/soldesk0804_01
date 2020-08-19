package model.DTO;

import java.sql.Timestamp;

public class PurchaseDTO {
	String userId;
	Long pcNum;
	Long cctNum;
	int totalPrice;
	Timestamp regDate;
	String seats;
	String cctTitle;
	String strPoster;
	
	public String getCctTitle() {
		return cctTitle;
	}
	public void setCctTitle(String cctTitle) {
		this.cctTitle = cctTitle;
	}
	public String getStrPoster() {
		return strPoster;
	}
	public void setStrPoster(String strPoster) {
		this.strPoster = strPoster;
	}
	int qty;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getPcNum() {
		return pcNum;
	}
	public void setPcNum(Long pcNum) {
		this.pcNum = pcNum;
	}
	public Long getCctNum() {
		return cctNum;
	}
	public void setCctNum(Long cctNum) {
		this.cctNum = cctNum;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	

}
