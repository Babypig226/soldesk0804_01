package model.DAO;

import java.util.ArrayList;
import java.util.List;

import controller.auditionNotice.Rename;
import model.DTO.AuditionNoticeDTO;

public class AuditionNoticeDAO extends DataBaseInfo{
	final String COLUMNS ="AUDITION_NOTICE_NUM, AUDITION_NOTICE_TITLE, AUDITION_NOTICE_APPERIOD, AUDITION_NOTICE_LOCATION, AUDITION_NOTICE_SELNUM, "
							+ "AUDITION_NOTICE_CATEGORY, EMPLOYEE_ID, REG_DATE, READ_COUNT, IMAGE, AUDITION_DATE, AUDITION_NOTICE_CONTENT, APPLY_CONDITION";
	final String SEQ = "select nvl(max(audition_notice_num),0)+1 from audition_notice";

	public void noticeInsert(AuditionNoticeDTO dto) {
		 conn = getConnection();
		 sql = "insert into audition_notice ("+COLUMNS
				 +") values(("+SEQ+"), ?, ?, ?, ?, ?, ?, sysdate, default, ?, ?, ?, ?)";
		 try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, dto.getAuditionNoticeTitle());
			 pstmt.setString(2, dto.getAuditionNoticeApperiod());
			 pstmt.setString(3, dto.getAuditionNoticeLocation());
			 pstmt.setInt(4, dto.getAuditionNoticeSelnum());
			 pstmt.setString(5, dto.getAuditionNoticeCategory());
			 pstmt.setString(6, "babypig226");
			 pstmt.setString(7, dto.getImage());
			 pstmt.setString(8, dto.getAuditionDate());
			 pstmt.setString(9, dto.getAuditionContent());
			 pstmt.setString(10, dto.getApplyCondition());
			 int i = pstmt.executeUpdate();
			 System.out.println("오디션공지글이 "+i+"건 등록되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
	}

	public List<AuditionNoticeDTO> anSel() {
		List<AuditionNoticeDTO> list = new ArrayList<AuditionNoticeDTO>();
			conn = getConnection();
			sql = "select "+COLUMNS+" from audition_notice order by reg_date desc";
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					AuditionNoticeDTO dto = new AuditionNoticeDTO();
					dto.setApplyCondition(rs.getString("apply_condition"));
					dto.setAuditionContent(rs.getString("audition_notice_content"));
					dto.setAuditionDate(rs.getString("audition_date"));
					dto.setAuditionNoticeApperiod(rs.getString("audition_notice_apperiod"));
					
					String auditionNoticeCategory = rs.getString("audition_notice_category");
					Rename rename = new Rename();
					dto.setAuditionNoticeCategory(rename.categoryRename(auditionNoticeCategory));
					dto.setAuditionNoticeLocation(rs.getString("audition_notice_location"));
					dto.setAuditionNoticeNum(rs.getInt("audition_notice_num"));
					dto.setAuditionNoticeSelnum(rs.getInt("audition_notice_selnum"));
					dto.setAuditionNoticeTitle(rs.getString("audition_notice_title"));
					dto.setEmployeeId(rs.getString("employee_id"));
					dto.setImage(rs.getString("image"));
					dto.setReadCount(rs.getLong("read_count"));
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

	public int countList() {
		int count = 0;
		conn = getConnection();
		sql = "select count(*) from audition_notice";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return count;
	}

	public AuditionNoticeDTO anSelOne(String auditionNoticeNum) {
		AuditionNoticeDTO dto = new AuditionNoticeDTO();
		conn = getConnection();
		sql = "select "+COLUMNS+" from audition_notice where audition_notice_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, auditionNoticeNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setApplyCondition(rs.getString("apply_condition"));
				dto.setAuditionContent(rs.getString("audition_notice_content"));
				dto.setAuditionDate(rs.getString("audition_date"));
				dto.setAuditionNoticeApperiod(rs.getString("audition_notice_apperiod"));
				Rename rename = new Rename();
				dto.setAuditionNoticeCategory(rename.categoryRename(rs.getString("audition_notice_category")));
				dto.setAuditionNoticeLocation(rs.getString("audition_notice_location"));
				dto.setAuditionNoticeNum(rs.getInt("audition_notice_num"));
				dto.setAuditionNoticeSelnum(rs.getInt("audition_notice_selnum"));
				dto.setAuditionNoticeTitle(rs.getString("audition_notice_title"));
				dto.setImage(rs.getString("image"));
				dto.setReadCount(rs.getLong("read_count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	public void updateReadCount(String num, String tableName) {
		conn = getConnection();
		sql = "update "+ tableName + " set read_count = read_count +1 where audition_notice_num = "+num ;
		try {
			pstmt = conn.prepareStatement(sql);
			int i = pstmt.executeUpdate();
			System.out.println(tableName + "의 " +i+" 행의 READ COUNT가 업데이트 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void anDel(String auditionNoticeNum) {
		conn = getConnection();
		sql = "delete from audition_notice where audition_notice_num = ?";
//		+" and employee_id = ?"
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, auditionNoticeNum);
			int i = pstmt.executeUpdate();
			System.out.println("오디션 공지글 "+i+"건이 삭제되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
		
	}

	public void contentUpdate(AuditionNoticeDTO dto) {
		conn = getConnection();
		sql = "update audition_notice set AUDITION_NOTICE_TITLE = ?, AUDITION_NOTICE_APPERIOD = ?, "
				+ "AUDITION_NOTICE_LOCATION =?, AUDITION_NOTICE_SELNUM =?,"
				+ "AUDITION_NOTICE_CATEGORY = ?, REG_DATE = sysdate,"
				+ "AUDITION_DATE = ?, AUDITION_NOTICE_CONTENT = ?, APPLY_CONDITION = ? where audition_notice_num = ?";
//		+" and employee_id = ?"
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAuditionNoticeTitle());
			pstmt.setString(2, dto.getAuditionNoticeApperiod());
			pstmt.setString(3, dto.getAuditionNoticeLocation());
			pstmt.setInt(4, dto.getAuditionNoticeSelnum());
			pstmt.setString(5, dto.getAuditionNoticeCategory());
			pstmt.setString(6, dto.getAuditionDate());
			pstmt.setString(7, dto.getAuditionContent());
			pstmt.setString(8, dto.getApplyCondition());
			pstmt.setLong(9, dto.getAuditionNoticeNum());
			int i = pstmt.executeUpdate();
			System.out.println("오디션 내용이 " +i+"건 업데이트되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public int ANImgUpdate(AuditionNoticeDTO dto) {
		Integer i=0;
		conn = getConnection();
		sql = "update audition_notice set image = ? where audition_notice_num = ?";
//			+" and employee_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getImage());
			pstmt.setLong(2, dto.getAuditionNoticeNum());
//			pstmt.setString(3, dto.getEmployeeId());
			i = pstmt.executeUpdate();
			System.out.println("오디션 공지글 "+ i+ "건의 이미지정보가 수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;

	}
	

}
