package model.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.DTO.TicketElmntsDTO;

public class TicketsDAO extends DataBaseInfo{
	final String COLUMNS = "TKT_NUM, CCT_NUM, GRADE, PRICE, SEATNUM, REG_DATE, EMPLOYEE_ID, "
			+ " qty";
	String tktN = "select nvl(max(tkt_num), 0)+1 from tickets";

	public void setSeats(List<TicketElmntsDTO> list) {
		conn = getConnection();
		sql = "insert into tickets ("+COLUMNS+") values(("+tktN+"), ?, ?, ?, ?, sysdate, ?, "
				+ " 1)";
		int k = 0;
		try {
			for (int i = 0; i < list.size(); i++) {
				for (int j = 0; j < list.get(i).getSeats().size(); j++) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setLong(1, list.get(i).getCctNum());
					pstmt.setString(2, list.get(i).getGrade());
					pstmt.setInt(3, list.get(i).getPrice());
					pstmt.setString(4, list.get(i).getSeats().get(j));					
					pstmt.setString(5, list.get(i).getEmployeeId());
					k = pstmt.executeUpdate();
					System.out.println("티켓정보 "+k+"건이 생성되었습니다");
				}
				
			}
			if(k >= 1) {
				sql = "update concerts set tkt_val = 1 where cct_num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setLong(1, list.get(0).getCctNum());
				int j = pstmt.executeUpdate();
				System.out.println("Concerts " + list.get(0).getCctNum()+"번에 "+"tktVal이 업데이트 되었습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public List<TicketElmntsDTO> ticketInfo(String num) {
		conn = getConnection();
		sql = "select TKT_NUM, GRADE, PRICE, SEATNUM from tickets where CCT_NUM = ?"
				+ " order by price desc";
		List<TicketElmntsDTO> list = new ArrayList<TicketElmntsDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TicketElmntsDTO dto = new TicketElmntsDTO();
				dto.setTktNum(rs.getLong("tkt_num"));
				dto.setGrade(rs.getString("grade"));
				dto.setCctNum(Long.parseLong(num));
				dto.setPrice(rs.getInt("price"));
				dto.setSeat(rs.getString("seatnum"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}


	public List<TicketElmntsDTO> ticketQty(String num) {
		List<TicketElmntsDTO> qty = new ArrayList<TicketElmntsDTO>();
		conn = getConnection();
		sql = "select sum(qty), grade, price from tickets where cct_num = ? group by grade, price order by price desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TicketElmntsDTO dto = new TicketElmntsDTO();
				dto.setQty(rs.getInt(1));
				dto.setGrade(rs.getString("grade"));
				dto.setPrice(rs.getInt("price"));
				qty.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return qty;
	}

	public List<TicketElmntsDTO> selChoosen(String[] seats, String cctNum) {
		List<TicketElmntsDTO> list = new ArrayList<TicketElmntsDTO>();
		conn = getConnection();
		sql = "select grade, seatNum, price  from tickets where seatNum = ? and cct_num = ?";
		try {
			for (int i = 0; i < seats.length; i++) {
				pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, seats[i]);
				pstmt.setString(2, cctNum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					TicketElmntsDTO dto = new TicketElmntsDTO();
					dto.setGrade(rs.getString("grade"));
					dto.setPrice(rs.getInt("price"));
					list.add(dto);
					
				rs.close();
				pstmt.close();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public void qtyUpdate(String[] seat, String cctNum) {
		conn = getConnection();
		sql = "update tickets set qty = 0 where seatNum = ? and cct_num = ?";
		try {
			for (String string : seat) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, string);
				pstmt.setString(2, cctNum);
				int i = pstmt.executeUpdate();
				System.out.println(i+"건의 티켓수량정보가 업데이트되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	
}
