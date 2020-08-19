package model.DAO;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import model.DTO.NoticeBoardDTO;

public class NoticeBoardDAO extends DataBaseInfo {

	final String COLUMNS = "NOTICE_NUM, NOTICE_ID, NOTICE_NAME, NOTICE_SUBJECT, NOTICE_CONTENT ,"
			+ " NOTICE_DATE, IP_ADDR, READ_COUNT";
	final String subQuery = " select nvl(max(NOTICE_NUM),0) +1 " + " from NOTICE";

	public void noticeInsert(NoticeBoardDTO dto) {
		conn = getConnection();
		sql = "insert into notice( " + COLUMNS + ")" + " values((" + subQuery + "),?,?,?,? " + " ,sysdate,?,0)";
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNoticeId());
			pstmt.setString(2, dto.getNoticeName());
			pstmt.setString(3, dto.getNoticeSubject());
			pstmt.setString(4, dto.getNoticeContent());
			pstmt.setString(5, dto.getIpAddr());

			System.out.println("NoticeId : " + dto.getNoticeId());
			System.out.println("NoticeName : " + dto.getNoticeName());
			System.out.println("NoticeSubject : " + dto.getNoticeSubject());
			System.out.println("NoticeContent " + dto.getNoticeContent());

			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 저장되었습니다.");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public List<NoticeBoardDTO> noticeSelectAll(int page, int limit, String num) {
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String condition = "";
		if (num != null)
			condition = " and NOTICE_NUM = " + num;

		List<NoticeBoardDTO> list = new ArrayList<NoticeBoardDTO>();
		conn = getConnection();
		sql = " select * " + " from ( select rownum rn, " + COLUMNS + "        from (select " + COLUMNS
				+ "              from notice where 1=1 " + condition + "              order by NOTICE_NUM  desc)) "
				+ " where rn between ? and ? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeBoardDTO dto = new NoticeBoardDTO();
				dto.setNoticeContent(rs.getString("notice_content"));
				dto.setNoticeNum(rs.getString("notice_num"));
				dto.setNoticeSubject(rs.getString("notice_subject"));
				dto.setNoticeName(rs.getString("notice_name"));
				// dto.setNoticeId(rs.getString("notice_id"));
				dto.setNoticeDate(rs.getTimestamp("notice_date"));
				dto.setReadCount(rs.getLong("read_count"));
				// System.out.println("noticename: " + rs.getString("notice_name"));
				// System.out.println("noticeid: " + rs.getString("notice_id"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public void updateReadCount(String num, String tableName) {
		conn = getConnection();
		sql = "update  " + tableName + " set READ_COUNT = READ_COUNT + 1 " + " where NOTICE_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public Integer noticeCount() {
		Integer i = 0;
		conn = getConnection();
		sql = "select count(*) cnt from notice ";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			i = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}

	public void noticeUpdate(NoticeBoardDTO dto) {
		conn = getConnection();
		sql = " update notice " + " set notice_subject = ? ," + "     notice_content = ? "
				+ " where notice_id = ? and notice_num =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNoticeSubject());
			pstmt.setString(2, dto.getNoticeContent());
			pstmt.setString(3, dto.getNoticeId());
			pstmt.setString(4, dto.getNoticeNum());

			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public int notBoardDel(String noticeId, String noticeNum) {
		Integer i = 0;
		conn = getConnection();
		sql = "delete from notice " + "where notice_id = ? " + "and notice_num =? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeId);
			pstmt.setString(2, noticeNum);

			System.out.println("noticeId : " + noticeId);
			System.out.println("noticeNum : " + noticeNum);
			
			i = pstmt.executeUpdate();
			System.out.println(i + "개가 삭제되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;

	}

}
