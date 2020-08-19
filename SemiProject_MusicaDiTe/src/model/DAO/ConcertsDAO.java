package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.ConcertsDTO;

public class ConcertsDAO extends DataBaseInfo{
final String COLUMNS = "CCT_NUM, EMPLOYEE_ID, CCT_TITLE, CCT_DATE, CCT_LOCATION, "
		+ " CCT_CONTENT, ORG_POSTER, STR_POSTER, ORG_DETAIL, STR_DETAIL,"
		+ " CCT_PROGRAM, ART_REG_NUM, REG_DATE, IP_ADDR, TKT_VAL, READ_COUNT";
String cctNum = "select nvl(max(cct_num),0)+1 from concerts";

public void cctInsert(ConcertsDTO dto) {
	conn = getConnection();
	sql = "insert into concerts (" + COLUMNS + ") "
			+" values(("+ cctNum +"), ?, ?, ?, ?,"
					+ " ?, ?, ?, ?, ?,"
					+ " ?, (select art_reg_num from artists where art_name = ? and instrument = ?), sysdate, ?, 0, 0)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getEmployeeId());
		pstmt.setString(2, dto.getCctTitle());
		pstmt.setTimestamp(3, dto.getCctDate());
		pstmt.setString(4, dto.getCctLocation());
		
		pstmt.setString(5, dto.getCctContent());
		pstmt.setString(6, dto.getOrgPoster());
		pstmt.setString(7, dto.getStrPoster());
		pstmt.setString(8, dto.getOrgDetail());
		pstmt.setString(9, dto.getStrDetail());
		
		pstmt.setString(10, dto.getCctProgram());
		
		pstmt.setString(11, dto.getArtName());
		pstmt.setString(12, dto.getInstrument());
		pstmt.setString(13, dto.getIpAddr());
		int i = pstmt.executeUpdate();
		System.out.println("공연정보 "+i+"건이 등록되었습니다.");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}
	
}

public List<ConcertsDTO> selAll() {
	List<ConcertsDTO> list = new ArrayList<ConcertsDTO>();
	conn = getConnection();
	sql = "select CCT_NUM, CCT_TITLE, CCT_DATE, CCT_LOCATION,"
			+" ORG_Poster, str_poster, employee_id, reg_date, tkt_val, read_count"
			+ " from concerts"
			+ " order by cct_date desc";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ConcertsDTO dto = new ConcertsDTO();
			dto.setCctTitle(rs.getString("cct_title"));
			dto.setCctDate(rs.getTimestamp("cct_date"));
			dto.setCctLocation(rs.getString("cct_location"));
			dto.setCctNum(rs.getLong("cct_num"));
			dto.setEmployeeId(rs.getString("employee_id"));
			dto.setRegDate(rs.getTimestamp("reg_date"));
			dto.setOrgPoster(rs.getString("org_poster"));
			dto.setStrPoster(rs.getString("str_poster"));
			dto.setReadCount(rs.getLong("read_count"));
			dto.setTktVal(rs.getString("tkt_val"));
			list.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}
	
	return list;
}

public ConcertsDTO detail(String num) {
	ConcertsDTO dto = new ConcertsDTO();
	conn = getConnection();
	sql = "select CCT_NUM, c.EMPLOYEE_ID ei, CCT_TITLE, CCT_DATE, CCT_LOCATION,"
			+ " CCT_CONTENT, ORG_POSTER, STR_POSTER, ORG_DETAIL, STR_DETAIL,"
			+ " CCT_PROGRAM, c.ART_REG_NUM arn, c.REG_DATE rd, IP_ADDR, art_name, instrument, c.read_count rc, tkt_val"
			+ " from concerts c "
			+ " join artists a "
			+ " on(a.art_reg_num=c.art_reg_num)"
			+ " where cct_num = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			dto.setCctNum(rs.getLong("cct_num"));
			dto.setEmployeeId(rs.getString("ei"));
			dto.setCctTitle(rs.getString("cct_title"));
			dto.setCctDate(rs.getTimestamp("cct_date"));
			dto.setCctLocation(rs.getString("CCT_LOCATION"));
			
			dto.setCctContent(rs.getString("cct_content"));
			dto.setOrgPoster(rs.getString("org_poster"));
			dto.setStrPoster(rs.getString("str_poster"));
			dto.setOrgDetail(rs.getString("org_detail"));
			dto.setStrDetail(rs.getString("str_detail"));
			
			dto.setCctProgram(rs.getString("cct_program"));
			dto.setArtRegNum(rs.getLong("arn"));
			dto.setRegDate(rs.getTimestamp("rd"));
			dto.setArtName(rs.getString("art_name"));
			dto.setInstrument(rs.getString("instrument"));
			dto.setReadCount(rs.getLong("rc"));
			dto.setTktVal(rs.getString("tkt_val"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}
	return dto;
}

public int delete(String cctNum) {
	int i = 0;
	conn = getConnection();
	sql = "delete from concerts where cct_num = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cctNum);
		i = pstmt.executeUpdate();
		System.out.println("공연정보 "+i+"건이 삭제되었습니다.");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}
	return i;
}

public void contentUpdate(ConcertsDTO dto) {
	conn = getConnection();
	sql = "update concerts set cct_title = ?, cct_date = ? , cct_location = ? ,"
			+ " art_reg_num = (select art_reg_num from artists where art_name = ? and instrument = ?),"
			+ " cct_program = ?, cct_content = ?, reg_date = sysdate"
			+ " where cct_num = ?";
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getCctTitle());
		pstmt.setTimestamp(2, dto.getCctDate());
		pstmt.setString(3, dto.getCctLocation());
		pstmt.setString(4, dto.getArtName());
		pstmt.setString(5, dto.getInstrument());
		pstmt.setString(6, dto.getCctProgram());
		pstmt.setString(7, dto.getCctContent());
		pstmt.setLong(8, dto.getCctNum());
		int i = pstmt.executeUpdate();
		System.out.println("공연 "+i+"건의 컨텐츠가 업데이트되었습니다.");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		
	}
	
}

public int fileUpdate(ConcertsDTO dto) {
	int i = 0;
	conn = getConnection();
	sql = "update concerts set str_poster = ? , org_poster = ?, str_detail = ?, org_detail = ?, reg_date = sysdate"
			+ " where cct_num = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getStrPoster());
		pstmt.setString(2, dto.getOrgPoster());
		pstmt.setString(3, dto.getStrDetail());
		pstmt.setString(4, dto.getOrgDetail());
		pstmt.setLong(5, dto.getCctNum());
		i = pstmt.executeUpdate();
		System.out.println("공연 "+i+"건의 파일정보가 업데이트되었습니다.");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}
	return i;
}

public Integer count() {
	int i = 0;
	conn = getConnection();
	sql = "select count(*) from concerts";
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

public void updateReadCount(String num, String tableName) {
	conn = getConnection();
	sql = "update "+ tableName + " set read_count = read_count +1 where cct_num = "+num ;
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

public List<ConcertsDTO> selectByYear(String cctYear, String yearBefore) {
	List<ConcertsDTO> list = new ArrayList<ConcertsDTO>();
	conn = getConnection();
	sql = "select CCT_NUM, CCT_TITLE, CCT_DATE, CCT_LOCATION,"
			+" ORG_Poster, str_poster, employee_id, reg_date, tkt_val, read_count"
			+ " from concerts"
			+ " where to_char(cct_date, 'yyyy') >= ? and to_char(cct_date, 'yyyy') < ? and cct_date < sysdate"
			+ " order by cct_date desc";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, yearBefore);
		pstmt.setString(2, cctYear);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ConcertsDTO dto = new ConcertsDTO();
			dto.setCctTitle(rs.getString("cct_title"));
			dto.setCctDate(rs.getTimestamp("cct_date"));
			dto.setCctLocation(rs.getString("cct_location"));
			dto.setCctNum(rs.getLong("cct_num"));
			dto.setEmployeeId(rs.getString("employee_id"));
			dto.setRegDate(rs.getTimestamp("reg_date"));
			dto.setOrgPoster(rs.getString("org_poster"));
			dto.setStrPoster(rs.getString("str_poster"));
			dto.setTktVal(rs.getString("tkt_val"));
			dto.setReadCount(rs.getLong("read_count"));
			dto.setTktVal(rs.getString("tkt_val"));
			list.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}
	
	return list;
	
}

public List<ConcertsDTO> upcomingConcert() {
	List<ConcertsDTO> list = new ArrayList<ConcertsDTO>();
	conn = getConnection();
	sql = "select CCT_NUM, CCT_TITLE, CCT_DATE, CCT_LOCATION,"
			+" ORG_Poster, str_poster, employee_id, reg_date, tkt_val, read_count"
			+ " from concerts"
			+ " where cct_date > sysdate"
			+ " order by cct_date desc";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ConcertsDTO dto = new ConcertsDTO();
			dto.setCctTitle(rs.getString("cct_title"));
			dto.setCctDate(rs.getTimestamp("cct_date"));
			dto.setCctLocation(rs.getString("cct_location"));
			dto.setCctNum(rs.getLong("cct_num"));
			dto.setEmployeeId(rs.getString("employee_id"));
			dto.setRegDate(rs.getTimestamp("reg_date"));
			dto.setOrgPoster(rs.getString("org_poster"));
			dto.setStrPoster(rs.getString("str_poster"));
			dto.setTktVal(rs.getString("tkt_val"));
			dto.setReadCount(rs.getLong("read_count"));
			dto.setTktVal(rs.getString("tkt_val"));
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
