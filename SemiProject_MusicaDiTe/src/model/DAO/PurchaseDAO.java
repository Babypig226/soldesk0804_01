package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.PurchaseDTO;

public class PurchaseDAO extends DataBaseInfo{
	final String COLUMNS = "PC_NUM, CCT_NUM, USER_ID, TOTAL_PRICE, REG_DATE, SEATNUM, QTY";
	String pcNum = "select nvl(max(pc_num),0)+1 from purchase_list";
	public void setPcList(PurchaseDTO dto) {
		conn = getConnection();
		sql = "insert into purchase_list("+COLUMNS+") "
				+ "values(("+pcNum+"), ?, ?, ?, sysdate, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, dto.getCctNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setInt(3, dto.getTotalPrice());
			pstmt.setString(4, dto.getSeats());
			pstmt.setInt(5, dto.getQty());
			int i = pstmt.executeUpdate();
			System.out.println(i+"건의 구매내역이 생성되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	public List<PurchaseDTO> selectAll(String userId) {
		List<PurchaseDTO> list = new ArrayList<PurchaseDTO>();
		conn = getConnection();
		sql = "select cct_title, str_poster, p.cct_num pcn, seatnum, qty, total_price, p.reg_date prd"
				+ " from purchase_list p"
				+ " join concerts c"
				+ " on (p.cct_num = c.cct_num)"
				+ " where user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
				while(rs.next()) {
					PurchaseDTO dto = new PurchaseDTO();
					dto.setCctNum(rs.getLong("pcn"));
					dto.setSeats(rs.getString("seatnum"));
					dto.setTotalPrice(rs.getInt("total_price"));
					dto.setQty(rs.getInt("qty"));
					dto.setRegDate(rs.getTimestamp("prd"));
					dto.setCctTitle(rs.getString("cct_title"));
					dto.setStrPoster(rs.getString("str_poster"));
					list.add(dto);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

}
