package model.DTO;

import java.util.List;

public class TicketElmntsDTO {
	Long cctNum;
	Long tktNum;
	String employeeId;
	String grade;
	int startRow;
	int startSeat;
	int endSeat;
	int price;
	List<String> seats;
	String seat;
	int qty;
	
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getStartSeat() {
		return startSeat;
	}
	public void setStartSeat(int startSeat) {
		this.startSeat = startSeat;
	}
	public int getEndSeat() {
		return endSeat;
	}
	public void setEndSeat(int endSeat) {
		this.endSeat = endSeat;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public void setSeats(List<String> seats) {
		this.seats = seats;
	}
	public List<String> getSeats(){
		return this.seats;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public Long getCctNum() {
		return cctNum;
	}
	public void setCctNum(Long cctNum) {
		this.cctNum = cctNum;
	}
	public Long getTktNum() {
		return tktNum;
	}
	public void setTktNum(Long tktNum) {
		this.tktNum = tktNum;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}


}
