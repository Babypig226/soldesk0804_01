package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.CenterBoardDTO;

public class CenterBoardDAO extends DataBaseInfo {

	final String COLUMNS = "BOARD_NUM,CENTER_ID,CENTER_NAME,CENTER_PASS," 
			+ "CENTER_SUBJECT,CENTER_CONTENT,CENTER_DATE,"
			+ " IP_ADDR,READ_COUNT,ORIGINAL_FILE_NAME," 
			+ " STORE_FILE_NAME,FILE_SIZE,"
			+ " BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ ";

	public List<CenterBoardDTO> cenSelectAll(int page, int limit, String num) {

		List<CenterBoardDTO> list = new ArrayList<CenterBoardDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String condition = "";
		if (num != null)
			condition = " and board_num = '" + num + "'";
		conn = getConnection();
		sql = " select * " + " from ( select rownum rn , " + COLUMNS + " 	 from ( select  " + COLUMNS
				+ " 	       from center " + "            where 1=1 " + condition
				+ "			   order by board_re_ref desc ," + "						board_re_seq asc))"
				+ " where rn between ? and ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CenterBoardDTO dto = new CenterBoardDTO();
				dto.setBoardNum(rs.getLong("Board_Num"));
				dto.setCenterName(rs.getString("Center_Name"));
				dto.setCenterPass(rs.getString("Center_Pass"));
				dto.setCenterSubject(rs.getString("Center_Subject"));
				dto.setCenterContent(rs.getString("Center_Content"));
				dto.setCenterDate(rs.getTimestamp("Center_Date"));
				dto.setIpAddr(rs.getString("Ip_Addr"));
				dto.setReadCount(rs.getLong("Read_Count"));
				dto.setOriginalFileName(rs.getString("Original_File_Name"));
				dto.setStoreFileName(rs.getString("Store_File_Name"));
				dto.setFileSize(rs.getLong("File_Size"));
				dto.setBoardReRef(rs.getLong("BOARD_RE_REF"));
				dto.setBoardReLev(rs.getLong("BOARD_RE_LEV"));
				dto.setBoardReSeq(rs.getLong("BOARD_RE_SEQ"));

				// System.out.println("Board_Num 뜨니" + rs.getLong("Board_Num"));
				// System.out.println("Center_Name 뜨니" + rs.getLong("Center_Name"));
				// System.out.println("Center_Pass 뜨니" + rs.getLong("Center_Pass"));
				// System.out.println("Center_Subject 뜨니" + rs.getLong("Center_Subject"));
				// System.out.println("Center_Content 뜨니" + rs.getLong("Center_Content"));

				// System.out.println("Center_Date 뜨니" + rs.getString("Center_Date"));
				// System.out.println("Center_Name 뜨니" + rs.getString("Center_Name"));

				// System.out.println("Center_Pass 뜨니" + rs.getString("Center_Pass"));
				// System.out.println("Center_Subject 뜨니" + rs.getString("Center_Subject"));
				// System.out.println("File_Size 뜨니" + rs.getString("File_Size"));
				// System.out.println("Ip_Addr 뜨니" + rs.getString("Ip_Addr"));

				list.add(dto);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public Integer cenCount() {
		Integer i = 0;
		conn = getConnection();
		sql = "select count(*) from center";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				i = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}

	public void cenInsert(CenterBoardDTO dto) {
		conn = getConnection();
		sql = " insert into center (" + COLUMNS + ")" + " values(NUM_SEQ.nextval,?,?,?,?,?,sysdate,"
				+ " ?,0,?,?,?, NUM_SEQ.currval, 0, 0)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCenterId());
			pstmt.setString(2, dto.getCenterName());
			// System.out.println(dto.getCenterName());
			pstmt.setString(3, dto.getCenterPass());
			// System.out.println(dto.getCenterPass());
			pstmt.setString(4, dto.getCenterSubject());
			pstmt.setString(5, dto.getCenterContent());
			// System.out.println(dto.getCenterContent());
			pstmt.setString(6, dto.getIpAddr());
			pstmt.setString(7, dto.getOriginalFileName());
			pstmt.setString(8, dto.getStoreFileName());
			pstmt.setLong(9, dto.getFileSize());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 저장되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void cenContentUpdate(CenterBoardDTO dto) {
		conn = getConnection();
		sql = " update center " + " set center_subject = ? ," + "     center_content = ?  " + " where board_num =? "
				+ " and center_pass =?  " + " and center_id  = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCenterSubject());
			pstmt.setString(2, dto.getCenterContent());
			pstmt.setLong(3, dto.getBoardNum());
			pstmt.setString(4, dto.getCenterPass());
			pstmt.setString(5, dto.getCenterId());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

	}

	public int centerboardDelete(String boardNum, String centerPass, String userId) {
		Integer i = 0;
		conn = getConnection();
		sql = "delete from center " + "where board_num =? and center_pass =?" + " and center_id =? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNum);
			pstmt.setString(2, centerPass);
			pstmt.setString(3, userId);
			i = pstmt.executeUpdate();
			System.out.println(i + "개가 삭제되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}

	public void cenSeqUpdate(CenterBoardDTO dto) {
		conn = getConnection();
		sql = " update center " + " set board_re_seq = board_re_seq + 1 " + " where board_re_seq > ? "
				+ " and board_Re_Ref = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, dto.getBoardReSeq());
			pstmt.setLong(2, dto.getBoardReRef());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public Integer fileUpdate(CenterBoardDTO dto) {
		Integer i = 0;
		conn = getConnection();
		sql = " update center " + " set original_file_name = ? ," + "		store_file_name = ? ,"
				+ "     file_size = ? " + " where board_num = ? " + "   and center_pass = ?" + "   and center_id = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getOriginalFileName());
			pstmt.setString(2, dto.getStoreFileName());
			pstmt.setLong(3, dto.getFileSize());
			pstmt.setLong(4, dto.getBoardNum());
			pstmt.setString(5, dto.getCenterPass());
			pstmt.setString(6, dto.getCenterId());
			i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}

	public void cenReplyInsert(CenterBoardDTO dto) {
		Long lev = dto.getBoardReLev() + 1;
		Long seq = dto.getBoardReSeq() + 1;
		conn = getConnection();
		sql = " insert into center (" + COLUMNS + ")" + " values(NUM_SEQ.nextval,?,?,?,?,?,sysdate,"
				+ " ?,0,null,null,0, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCenterId());
			pstmt.setString(2, dto.getCenterName());
			pstmt.setString(3, dto.getCenterPass());
			pstmt.setString(4, dto.getCenterSubject());
			pstmt.setString(5, dto.getCenterContent());
			pstmt.setString(6, dto.getIpAddr());
			pstmt.setLong(7, dto.getBoardReRef());
			pstmt.setLong(8, lev);
			pstmt.setLong(9, seq);
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 저장되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

}
