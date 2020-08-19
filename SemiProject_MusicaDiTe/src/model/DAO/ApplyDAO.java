package model.DAO;

import java.util.ArrayList;
import java.util.List;

import controller.auditionNotice.Rename;
import model.DTO.ApplyDTO;
import model.DTO.ApplyFinDTO;

public class ApplyDAO extends DataBaseInfo{
 final String COLUMNS = "USER_ID, USER_NAME, USER_BIRTH, org_id_p, str_ID_P, APP_ADDR, AUDITION_NOTICE_NUM,"
 		+ " INSTRUMENT, APP_EDU, APP_CAREER, ORG_ID_CARD, STR_ID_CARD, ORG_EDU_DOC, STR_EDU_DOC, ORG_CR_DOC, STR_CR_DOC, PRFRM_VD, APP_DATE, IP_ADDR, app_temp_num";
 String appNum = "select max(nvl(app_temp_num,0))+1 from apply_temp";
 final String AFCOLUMNS = "REG_NUM, APP_TEMP_NUM, AUDITION_NOTICE_NUM, USER_ID, USER_NAME, "
 						+ "USER_BIRTH, APP_ADDR, ORG_ID_P, STR_ID_P, INSTRUMENT, "
 						+ "APP_EDU, APP_CAREER, ORG_ID_CARD, STR_ID_CARD, ORG_EDU_DOC, "
 						+ "STR_EDU_DOC, ORG_CR_DOC, STR_CR_DOC, PRFRM_VD, REG_DATE, IP_ADDR";
 String regNum = "select max(nvl(reg_num, 0))+1 from apply_fin";
	public Integer applyInsert(ApplyDTO dto) {
		Integer appTempNum = 0;
		conn = getConnection();
		sql = "insert into apply_temp ("+COLUMNS+") values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ("+appNum+"))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserName());
			pstmt.setTimestamp(3, dto.getUserBirth());
			pstmt.setString(4, dto.getOrgIdP());
			pstmt.setString(5, dto.getStrIdP());
			pstmt.setString(6, dto.getAppAddr());
			pstmt.setLong(7, dto.getAuditionNoticeNum());
			pstmt.setString(8, dto.getInstrument());
			pstmt.setString(9, dto.getAppEdu());
			pstmt.setString(10, dto.getAppCareer());
			pstmt.setString(11, dto.getOrgIdCard());
			pstmt.setString(12, dto.getStrIdCard());
			pstmt.setString(13, dto.getOrgEduDoc());
			pstmt.setString(14, dto.getStrEduDoc());
			pstmt.setString(15, dto.getOrgCrDoc());
			pstmt.setString(16, dto.getStrCrDoc());
			pstmt.setString(17, dto.getPrfrmVd());
			pstmt.setString(18, dto.getIpAddr());
			int i = pstmt.executeUpdate();
			System.out.println(dto.getAuditionNoticeNum()+"번 오디션에  "+i+"개의 참가신청서가 임시저장되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		conn = getConnection();
		sql = "select app_temp_num from apply_temp where audition_notice_num = ? and user_name = ?"
				+" and user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, dto.getAuditionNoticeNum());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getUserId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
			appTempNum = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return appTempNum;
	}
	public ApplyDTO appSel(String appTempNum, String userId) {
		conn = getConnection();
		sql = "select USER_ID, USER_NAME, USER_BIRTH, org_id_p, str_ID_P, APP_ADDR, app.AUDITION_NOTICE_NUM adn," + 
				" INSTRUMENT, APP_EDU, APP_CAREER, ORG_ID_CARD, STR_ID_CARD, ORG_EDU_DOC, STR_EDU_DOC, "
				+ "ORG_CR_DOC, STR_CR_DOC, PRFRM_VD, APP_DATE, IP_ADDR, app_temp_num,"
				+ " audition_notice_title, audition_notice_category "
				+ " from apply_temp app"
				+ " join audition_notice an"
				+ " on(app.audition_notice_num = an.audition_notice_num)"
				+ " where app_temp_num = ?"
				+" and user_id = ?";
		ApplyDTO dto = new ApplyDTO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, appTempNum);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			dto.setAppAddr(rs.getString("app_addr"));
			dto.setAppTempNum(rs.getLong("app_temp_num"));
			dto.setAppCareer(rs.getString("app_career"));
			dto.setAppDate(rs.getTimestamp("app_date"));
			dto.setAppEdu(rs.getString("app_edu"));
			dto.setAuditionNoticeNum(rs.getLong("adn"));
			Rename rename = new Rename();
			String instrument = rename.InstrumentRename(rs.getString("Instrument"));
			dto.setInstrument(instrument);
			dto.setOrgCrDoc(rs.getString("org_cr_doc"));
			dto.setOrgEduDoc(rs.getString("org_edu_doc"));
			dto.setOrgIdCard(rs.getString("org_id_card"));
			dto.setOrgIdP(rs.getString("org_id_p"));
			dto.setPrfrmVd(rs.getString("prfrm_vd"));
			dto.setStrCrDoc(rs.getString("str_cr_doc"));
			dto.setStrEduDoc(rs.getString("str_edu_doc"));
			dto.setStrIdCard(rs.getString("str_id_card"));
			dto.setStrIdP(rs.getString("str_id_p"));
			dto.setUserBirth(rs.getTimestamp("user_birth"));
			dto.setUserName(rs.getString("user_name"));
			String auditionNoticeCategory = rename.categoryRename(rs.getString("audition_notice_category"));
			dto.setAuditionNoticeCategory(auditionNoticeCategory);
			dto.setAuditionNoticeTitle(rs.getString("audition_notice_title"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	public List<ApplyDTO> setList(String userId) {
		List<ApplyDTO> applications = new ArrayList<ApplyDTO>();
		conn = getConnection();
		try {
		
			sql = "select  USER_ID, USER_NAME, USER_BIRTH, org_id_p, str_ID_P, APP_ADDR, app.AUDITION_NOTICE_NUM adn," 
					+" INSTRUMENT, APP_EDU, APP_CAREER, ORG_ID_CARD, STR_ID_CARD, ORG_EDU_DOC, STR_EDU_DOC, ORG_CR_DOC, STR_CR_DOC, PRFRM_VD, "
					+ "APP_DATE, IP_ADDR, app_temp_num, audition_notice_category, audition_notice_title"
					+ " from apply_temp app"
					+ " left outer join audition_notice an"
					+ " on(app.audition_notice_num = an.audition_notice_num)"
					+ " where user_id = ? "
					+ " order by app.audition_notice_num asc";
			pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ApplyDTO adto = new ApplyDTO();					
					adto.setAppAddr(rs.getString("app_addr"));
					adto.setAppTempNum(rs.getLong("app_temp_num"));
					adto.setAppCareer(rs.getString("app_career"));
					adto.setAppDate(rs.getTimestamp("app_date"));
					adto.setAppEdu(rs.getString("app_edu"));
					adto.setAuditionNoticeNum(rs.getLong("adn"));
					Rename rename = new Rename();
					String instrument = rename.InstrumentRename(rs.getString("Instrument"));
					adto.setInstrument(instrument);
					adto.setOrgCrDoc(rs.getString("org_cr_doc"));
					adto.setOrgEduDoc(rs.getString("org_edu_doc"));
					adto.setOrgIdCard(rs.getString("org_id_card"));
					adto.setOrgIdP(rs.getString("org_id_p"));
					adto.setPrfrmVd(rs.getString("prfrm_vd"));
					adto.setStrCrDoc(rs.getString("str_cr_doc"));
					adto.setStrEduDoc(rs.getString("str_edu_doc"));
					adto.setStrIdCard(rs.getString("str_id_card"));
					adto.setStrIdP(rs.getString("str_id_p"));
					adto.setUserBirth(rs.getTimestamp("user_birth"));
					adto.setUserName(rs.getString("user_name"));
					String category = rename.categoryRename(rs.getString("audition_notice_category"));
					adto.setAuditionNoticeCategory(category);
					adto.setAuditionNoticeTitle(rs.getString("audition_notice_title"));
					applications.add(adto);
				
				}
			
		 }catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return applications;
	}
	
	public Integer countApplications(String userId) {
		Integer i = 0;
		conn = getConnection();
		sql = "select count(*) from apply_temp where user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				i = rs.getInt(1);}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}
	public Integer applyDel(String appTempNum) {
		Integer i = 0;
		conn = getConnection();
		sql = "delete from apply_temp where app_temp_num = ?";
//		" and user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, appTempNum);
			 i = pstmt.executeUpdate();
			System.out.println("임시저장된 신청서 "+i+"건이 삭제되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
		
	}
	public void updateContent(ApplyDTO dto) {
		conn = getConnection();
		sql = "update apply_temp set user_name = ?, user_birth = ?, app_addr = ?, instrument = ?, app_edu=?, app_career = ? "
				+ " where user_id = ? and app_temp_num = ? ";
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserName());
			pstmt.setTimestamp(2, dto.getUserBirth());
			pstmt.setString(3, dto.getAppAddr());
			pstmt.setString(4, dto.getInstrument());
			pstmt.setString(5, dto.getAppEdu());
			pstmt.setString(6, dto.getAppCareer());
			pstmt.setString(7, dto.getUserId());
			pstmt.setLong(8, dto.getAppTempNum());
			int i = pstmt.executeUpdate();
			System.out.println(i+"건의 참가신청서가 수정되었습니다.");
			System.out.println(dto.getUserName());
			System.out.println(dto.getUserBirth());
			System.out.println(dto.getAppAddr());
			System.out.println(dto.getInstrument());
			System.out.println(dto.getAppEdu());
			System.out.println(dto.getAppCareer());
			System.out.println(dto.getUserId());
			System.out.println(dto.getAppTempNum());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	public Integer fileUpdate(ApplyDTO dto) {
		Integer i = 0;
		conn = getConnection();
		sql = "update apply_temp set org_cr_doc = ?, str_cr_doc = ?, org_id_p = ?, str_id_p = ? ,"
				+ " org_id_card = ?, str_id_card = ?, org_edu_doc = ?, str_edu_doc = ? "
				+ "where user_id = ? and app_temp_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getOrgCrDoc());
			pstmt.setString(2, dto.getStrCrDoc());
			pstmt.setString(3, dto.getOrgIdP());
			pstmt.setString(4, dto.getStrIdP());
			pstmt.setString(5, dto.getOrgIdCard());
			pstmt.setString(6, dto.getStrIdCard());
			pstmt.setString(7, dto.getOrgEduDoc());
			pstmt.setString(8, dto.getStrEduDoc());
			pstmt.setString(9, dto.getUserId());
			pstmt.setLong(10, dto.getAppTempNum());
			i = pstmt.executeUpdate();
			System.out.println(i+"건의 신청서 파일정보가 업데이트 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}
	public Integer applyFinInsert(ApplyFinDTO dto) {
//		 "REG_NUM, APP_TEMP_NUM, AUDITION_NOTE_NUM, USER_ID, USER_NAME, "
//					+ "USER_BIRTH, APP_ADDR, ORG_ID_P, STR_ID_P, INSTRUMENT, "
//					+ "APP_EDU, APP_CAREER, ORG_ID_CARD, STR_ID_CARD, ORG_EDU_DOC, "
//					+ "STR_EDU_DOC, ORG_CR_DOC, STR_CR_DOC, PRFRM_VD, REG_DATE, IP_ADDR";
		Integer i = 0;
		conn = getConnection();
		sql = "insert into apply_fin ("+AFCOLUMNS+") "
				+ "values(("+regNum+"), ?, ?, ?, ?, "
				+ "?, ?, ?, ?, ?, "
				+ "?, ?, ?, ?, ?, "
				+ "?, ?, ?, ?, sysdate, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, dto.getAppTempNum());
			pstmt.setLong(2, dto.getAuditionNoticeNum());
			pstmt.setString(3, dto.getUserId());
			pstmt.setString(4, dto.getUserName());
			pstmt.setTimestamp(5, dto.getUserBirth());
			pstmt.setString(6, dto.getAppAddr());
			pstmt.setString(7, dto.getOrgIdP());
			pstmt.setString(8, dto.getStrIdP());
			pstmt.setString(9, dto.getInstrument());
			pstmt.setString(10,dto.getAppEdu());
			pstmt.setString(11, dto.getAppCareer());
			pstmt.setString(12, dto.getOrgIdCard());
			pstmt.setString(13, dto.getStrIdCard());
			pstmt.setString(14, dto.getOrgEduDoc());
			pstmt.setString(15, dto.getStrEduDoc());
			pstmt.setString(16, dto.getOrgCrDoc());
			pstmt.setString(17, dto.getStrCrDoc());
			pstmt.setString(18, dto.getPrfrmVd());
			pstmt.setString(19, dto.getIpAddr());			
			i = pstmt.executeUpdate();
			System.out.println("오디션 신청서(최종)가"+ i+"건 등록되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}
	public List<ApplyFinDTO> selFnList(String userId) {
		String num = "";
		if(regNum != null) {
			num = regNum;
		}
		List<ApplyFinDTO> list = new ArrayList<ApplyFinDTO>();
		conn = getConnection();
		sql = "select REG_NUM, APP_TEMP_NUM, af.AUDITION_NOTICE_NUM, USER_ID, USER_NAME," 
				+" USER_BIRTH, APP_ADDR, ORG_ID_P, STR_ID_P, INSTRUMENT," 
				+" APP_EDU, APP_CAREER, ORG_ID_CARD, STR_ID_CARD, ORG_EDU_DOC," 
				+" STR_EDU_DOC, ORG_CR_DOC, STR_CR_DOC, PRFRM_VD, af.REG_DATE, "
				+ " audition_notice_category, audition_notice_title"
				+" from apply_fin af "
				+ " join audition_notice an"
				+ " on(af.audition_notice_num = an.audition_notice_num) where af.user_id = ?"
				+ " order by af.reg_date";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ApplyFinDTO dto = new ApplyFinDTO();
				dto.setAppAddr(rs.getString("app_addr"));
				dto.setAppCareer(rs.getString("app_career"));
				dto.setAppEdu(rs.getString("app_edu"));
				dto.setAppTempNum(rs.getLong("app_temp_num"));
				dto.setAuditionNoticeNum(rs.getLong("audition_notice_num"));
				dto.setInstrument(rs.getString("instrument"));
				dto.setOrgCrDoc(rs.getString("org_cr_doc"));
				dto.setOrgEduDoc(rs.getString("org_edu_doc"));
				dto.setOrgIdCard(rs.getString("org_id_card"));
				dto.setOrgIdP(rs.getString("org_id_p"));
				dto.setPrfrmVd(rs.getString("prfrm_vd"));
				dto.setRegNum(rs.getLong("reg_num"));
				dto.setStrCrDoc(rs.getString("str_cr_doc"));
				dto.setStrEduDoc(rs.getString("str_edu_doc"));
				dto.setStrIdCard(rs.getString("str_id_card"));
				dto.setStrIdP(rs.getString("str_id_p"));
				dto.setUserBirth(rs.getTimestamp("user_birth"));
				dto.setUserId(rs.getString("user_id"));
				dto.setUserName(rs.getString("user_Name"));
				Rename rename = new Rename();
				String category = rename.categoryRename(rs.getString("audition_notice_category"));
				dto.setAuditionNoticeCategory(category);
				dto.setAuditionNoticeTitle(rs.getString("audition_notice_title"));
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
	public ApplyFinDTO selFnOne(String userId, String regNum) {
		ApplyFinDTO dto = new ApplyFinDTO();
		conn = getConnection();
		sql = "select REG_NUM, APP_TEMP_NUM, af.AUDITION_NOTICE_NUM, USER_ID, USER_NAME," 
				+" USER_BIRTH, APP_ADDR, ORG_ID_P, STR_ID_P, INSTRUMENT," 
				+" APP_EDU, APP_CAREER, ORG_ID_CARD, STR_ID_CARD, ORG_EDU_DOC," 
				+" STR_EDU_DOC, ORG_CR_DOC, STR_CR_DOC, PRFRM_VD, af.REG_DATE, "
				+ " audition_notice_category, audition_notice_title"
				+" from apply_fin af "
				+ " join audition_notice an"
				+ " on(af.audition_notice_num = an.audition_notice_num) "
				+ " where af.user_id = ? and reg_num = ?"
				+ " order by af.reg_date";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, regNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setAppAddr(rs.getString("app_addr"));
				dto.setAppCareer(rs.getString("app_career"));
				dto.setAppEdu(rs.getString("app_edu"));
				dto.setAppTempNum(rs.getLong("app_temp_num"));
				dto.setAuditionNoticeNum(rs.getLong("audition_notice_num"));
				dto.setInstrument(rs.getString("instrument"));
				dto.setOrgCrDoc(rs.getString("org_cr_doc"));
				dto.setOrgEduDoc(rs.getString("org_edu_doc"));
				dto.setOrgIdCard(rs.getString("org_id_card"));
				dto.setOrgIdP(rs.getString("org_id_p"));
				dto.setPrfrmVd(rs.getString("prfrm_vd"));
				dto.setRegNum(rs.getLong("reg_num"));
				dto.setStrCrDoc(rs.getString("str_cr_doc"));
				dto.setStrEduDoc(rs.getString("str_edu_doc"));
				dto.setStrIdCard(rs.getString("str_id_card"));
				dto.setStrIdP(rs.getString("str_id_p"));
				dto.setUserBirth(rs.getTimestamp("user_birth"));
				dto.setUserId(rs.getString("user_id"));
				dto.setUserName(rs.getString("user_Name"));
				dto.setAuditionNoticeCategory(rs.getString("audition_notice_category"));
				dto.setAuditionNoticeTitle(rs.getString("audition_notice_title"));
				dto.setRegDate(rs.getTimestamp("reg_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
		
	}
	public Integer countFin(String userId) {
		Integer count = 0;
		conn = getConnection();
		sql = "select count(*) from apply_fin where user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return count;
	}
	

}
