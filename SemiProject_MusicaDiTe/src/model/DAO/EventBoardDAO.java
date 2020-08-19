package model.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.DTO.EventBoardDTO;
import model.DTO.EventRepliesDTO;
import model.DTO.ReplyDTO;

public class EventBoardDAO extends DataBaseInfo {
	final String COLUMNS = "EVENT_NO, EUSER_ID, " + "REG_DATE, EVENT_SUBJECT," + "EVENT_CONTENT";
	final String subQuery = " select nvl(max(EVENT_NO),0) +1 " + " from EVENT";
	final String REPLYCOLUMNS = "REPLY_NO,RUSER_ID," + "EVENT_NO,EUSER_ID, REG_DATE,REPLY_CONTENT";
	final String replySubQuery = " select nvl(max(reply_NO),0) +1 " + " from reply";

	public void eventInsert(EventBoardDTO dto) {
		conn = getConnection();
		sql = "insert into event( " + COLUMNS + ")" + " values((" + subQuery + "),?,sysdate,?,? )";
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEuserId());
			pstmt.setString(2, dto.getEventSubject());
			pstmt.setString(3, dto.getEventContent());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 저장되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public List<EventBoardDTO> eventSelectAll(int page, int limit) {
		List<EventBoardDTO> list = new ArrayList<EventBoardDTO>();
		conn = getConnection();
		sql = " select * " + " from ( select rownum rn, " + COLUMNS + "        from (select " + COLUMNS
				+ "              from event " + "              order by EVENT_NO  desc)) "
				+ " where rn between ? and ? ";
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				EventBoardDTO dto = new EventBoardDTO();
				dto.setEventContent(rs.getString("event_content"));
				dto.setEventNo(rs.getLong("event_no"));
				dto.setEventSubject(rs.getString("event_subject"));
				dto.setEuserId(rs.getString("euser_id"));
				dto.setRegDate(rs.getTimestamp("reg_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public Integer eventCount() {
		Integer i = 0;
		conn = getConnection();
		sql = "select count(*) from event ";
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

	public EventRepliesDTO eventCollection(String eventNo) {
		// 1인 comment저장하기 위한 객체
		EventBoardDTO dto = new EventBoardDTO();
		// reply를 n개 저장하기 위한 list
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		// comment와 reply인 list를 저장하기 위한 객체.
		EventRepliesDTO erdto = new EventRepliesDTO();
		conn = getConnection();
		sql = " select e.event_no eno, e.euser_id eid, " + "     e.EVENT_SUBJECT esubject , "
				+ "     e.EVENT_CONTENT eCONTENT , e.REG_DATE edate," + "     r.REPLY_NO rno, r.RUSER_ID rid,"
				+ "     r.REG_DATE rdate , r.REPLY_CONTENT rcontent" + " from event e left outer join reply r"
				+ " on e.event_no = r.event_no " + " where e.event_no = ?";
		try {
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, eventNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setEventContent(rs.getString("eCONTENT"));
				dto.setEventNo(rs.getLong("eno"));
				dto.setEventSubject(rs.getString("esubject"));
				dto.setEuserId(rs.getString("eid"));
				dto.setRegDate(rs.getTimestamp("edate"));
			}
			rs.beforeFirst();
			while (rs.next()) {
				ReplyDTO redto = new ReplyDTO();
				redto.setRegDate(rs.getTimestamp("rdate"));
				redto.setReplyContent(rs.getString("rCONTENT"));
				redto.setReplyNo(rs.getLong("rNO"));
				redto.setRuserId(rs.getString("rID"));
				list.add(redto);
			}
			erdto.setEventDTO(dto);
			erdto.setReplies(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return erdto;
	}

	public void eventUpdate(EventBoardDTO dto) {
		conn = getConnection();
		sql = " update event " + " set event_subject = ? ," + "     event_content = ? "
				+ " where euser_id = ? and event_No =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEventSubject());
			pstmt.setString(2, dto.getEventContent());
			pstmt.setString(3, dto.getEuserId());
			pstmt.setLong(4, dto.getEventNo());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void eventDelete(String eventNo, String euserId) {
		conn = getConnection();
		sql = " delete from event " + " where event_no = ? " + " and euser_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eventNo);
			pstmt.setString(2, euserId);
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 삭제됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void replyInsert(ReplyDTO dto) {
		conn = getConnection();
		sql = " insert into REPLY(" + REPLYCOLUMNS + ")" + " values((" + replySubQuery + "),?,?,?,sysdate,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRuserId());
			pstmt.setLong(2, dto.getEventNo());
			pstmt.setString(3, dto.getEuserId());
			pstmt.setString(4, dto.getReplyContent());

			int i = pstmt.executeUpdate();
			System.out.println("replyInsert" + i + "개 생성됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

	}
}