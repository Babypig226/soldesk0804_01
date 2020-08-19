package model.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import controller.auditionNotice.Rename;
import model.DTO.ArtistsDTO;
import model.DTO.ArtistsSrchDTO;

public class ArtistsDAO extends DataBaseInfo{
	final String COLUMNS = "EMPLOYEE_ID, ART_REG_NUM, ART_NAME, ORG_PROFILE, STR_PROFILE, "
			+ " MNG_NAME, ART_CONTCT, MNG_CONTCT, ART_EMAIL, ART_SNS, "
			+ " ART_ED, ART_AWARDS, ART_CR, INSTRUMENT, CONTRCT_TYPE, "
			+ " CONTRCT_DATE, EXPIRE_DATE, ORG_DOC, STR_DOC, ORG_ALBUM_INFO, "
			+ " STR_ALBUM_INFO, VIDEO, REG_DATE, READ_COUNT";
	String regNum = "(select nvl(max(art_reg_num),0)+1 from artists)";
	public void artsInsert(ArtistsDTO dto) {
		//"EMPLOYEE_ID, ART_REG_NUM, ART_NAME, ORG_PROFILE, STR_PROFILE, "
//				+ " MNG_NAME, ART_CONTCT, MNG_CONTCT, ART_EMAIL, ART_SNS, "
//				+ " ART_ED, ART_AWARDS, ART_CR, INSTRUMENT, CONTRCT_TYPE, "
//				+ " CONTRCT_DATE, EXPIRE_DATE, ORG_DOC, STR_DOC, ORG_ALBUM_INFO, "
//				+ " STR_ALBUM_INFO, VIDEO, REG_DATE";
		conn = getConnection();
		sql = "insert into artists ( "+ COLUMNS+" ) "
				+ " values (?, "+regNum+", ?, ?, ?, "
				+ " ?, ?, ?, ?, ?, "
				+ " ?, ?, ?, ?, ?, "
				+ " ?, ?, ?, ?, ?, "
				+ " ?, ?, sysdate, 0)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getEmployeeId());
			pstmt.setString(2, dto.getArtName());
			pstmt.setString(3, dto.getOrgProfile());
			pstmt.setString(4, dto.getStrProfile());
			
			pstmt.setString(5, dto.getMngName());
			pstmt.setString(6, dto.getArtContct());
			pstmt.setString(7, dto.getMngContct());
			pstmt.setString(8, dto.getArtEmail());
			pstmt.setString(9, dto.getArtSns());
			
			pstmt.setString(10, dto.getArtEd());
			pstmt.setString(11, dto.getArtAwards());
			pstmt.setString(12, dto.getArtCr());
			pstmt.setString(13, dto.getInstrument());
			pstmt.setString(14, dto.getContrctType());
			
			pstmt.setTimestamp(15, dto.getContrctDate());
			pstmt.setTimestamp(16, dto.getExpireDate());
			pstmt.setString(17, dto.getOrgDoc());
			pstmt.setString(18, dto.getStrDoc());
			pstmt.setString(19, dto.getOrgAlbumInfo());
			
			pstmt.setString(20, dto.getStrAlbumInfo());
			pstmt.setString(21, dto.getVideo());
			
			int i = pstmt.executeUpdate();
			System.out.println(i + "명의 아티스트 정보가 등록되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	public List<ArtistsDTO> selflist() {
		List<ArtistsDTO> list = new ArrayList<ArtistsDTO>();
		conn = getConnection();
		sql = "select "+ COLUMNS+" "
				+ " from artists "
				+ " order by REG_DATE desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ArtistsDTO dto = new ArtistsDTO();
				dto.setArtRegNum(rs.getLong("art_reg_num"));
				dto.setStrProfile(rs.getString("str_profile"));
				Rename re = new Rename();
				String instrmnt = re.InstrumentRename(rs.getString("instrument"));
				dto.setInstrument(instrmnt);
				dto.setMngName(rs.getString("mng_name"));
				dto.setArtName(rs.getString("art_name"));
				dto.setReadCount(rs.getLong("read_count"));
				list.add(dto);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public ArtistsDTO selFdetail(String artRegNum) {
		ArtistsDTO dto = new ArtistsDTO();
		conn = getConnection();
		sql = "select "+COLUMNS+" "
				+ " from artists where ART_REG_NUM = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, artRegNum);
			rs = pstmt.executeQuery();
					if(rs.next()) {
						dto.setArtAwards(rs.getString("art_awards"));
						dto.setArtContct(rs.getString("art_contct"));
						dto.setArtCr(rs.getString("art_cr"));
						dto.setArtEd(rs.getString("art_ed"));
						dto.setArtEmail(rs.getString("art_email"));
						dto.setArtName(rs.getString("art_name"));
						dto.setArtRegNum(rs.getLong("art_reg_num"));
						dto.setArtSns(rs.getString("art_sns"));
						dto.setContrctDate(rs.getTimestamp("contrct_date"));
						dto.setContrctType(rs.getString("contrct_type"));
						dto.setExpireDate(rs.getTimestamp("expire_date"));
						Rename re = new Rename();
						String instrmnt = re.InstrumentRename(rs.getString("instrument"));
						dto.setInstrument(instrmnt);
						dto.setMngContct(rs.getString("mng_contct"));
						dto.setMngName(rs.getString("mng_name"));
						dto.setOrgAlbumInfo(rs.getString("org_album_info"));
						dto.setOrgDoc(rs.getString("org_doc"));
						dto.setOrgProfile(rs.getString("org_profile"));
						dto.setRegDate(rs.getTimestamp("reg_date"));
						dto.setStrAlbumInfo(rs.getString("str_album_info"));
						dto.setStrDoc(rs.getString("str_doc"));
						dto.setStrProfile(rs.getString("str_profile"));
						dto.setVideo(rs.getString("video"));
						dto.setReadCount(rs.getLong("read_count"));
					}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	}
	public int artistsDel(String artRegNum, String employeeId) {
		int i = 0;
		conn = getConnection();
		sql = "delete from artists where employee_id = ? and art_reg_num = ?";
		try {
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, employeeId);
		 pstmt.setString(2, artRegNum);
		 i = pstmt.executeUpdate();
		 System.out.println("아티스트 정보 "+i+"건이 삭제되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}
	public void contentUpdate(ArtistsDTO dto) {
		conn = getConnection();
		sql = "update artists "
				+ "set ART_NAME = ?, MNG_NAME = ?, ART_CONTCT = ?, MNG_CONTCT = ?, ART_EMAIL = ?, "
				+ "ART_SNS = ?, ART_ED = ?, ART_AWARDS = ?, ART_CR = ?, "
				+ "CONTRCT_DATE = ?, EXPIRE_DATE = ?,  VIDEO = ?, REG_DATE = sysdate"
				+ " where employee_id = ? and art_reg_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getArtName());			
			pstmt.setString(2, dto.getMngName());
			pstmt.setString(3, dto.getArtContct());
			pstmt.setString(4, dto.getMngContct());
			pstmt.setString(5, dto.getArtEmail());
			
			pstmt.setString(6, dto.getArtSns());
			pstmt.setString(7, dto.getArtEd());
			pstmt.setString(8, dto.getArtAwards());
			pstmt.setString(9, dto.getArtCr());
			
			pstmt.setTimestamp(10, dto.getContrctDate());
			pstmt.setTimestamp(11, dto.getExpireDate());
			pstmt.setString(12, dto.getVideo());
			
			pstmt.setString(13, dto.getEmployeeId());
			pstmt.setLong(14, dto.getArtRegNum());
			int i = pstmt.executeUpdate();
			System.out.println("아티스트 정보 "+i+"건이 업데이트 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	public int fileUpdate(ArtistsDTO dto) {
		int i = 0;
		conn = getConnection();
		sql = "update artists"
				+ " set ORG_PROFILE =?, STR_PROFILE =?, ORG_DOC =?, STR_DOC =?, ORG_ALBUM_INFO =?, STR_ALBUM_INFO =?"
				+ " where employee_id = ? and art_reg_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getOrgProfile());
			pstmt.setString(2, dto.getStrProfile());
			pstmt.setString(3, dto.getOrgDoc());
			pstmt.setString(4, dto.getOrgDoc());
			pstmt.setString(5, dto.getOrgAlbumInfo());
			pstmt.setString(6, dto.getOrgAlbumInfo());
			pstmt.setString(7, dto.getEmployeeId());
			pstmt.setLong(8, dto.getArtRegNum());
			i = pstmt.executeUpdate();
			System.out.println("연주자의 파일정보가 "+i+"건 업데이트 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}
	public ArtistsSrchDTO artistsSearch(String instrument) {
		ArtistsSrchDTO dto = new ArtistsSrchDTO();
		List<String> artName = new ArrayList<String>();
		conn = getConnection();
		sql = "select art_name, instrument from artists where instrument = ?";
		try {
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, instrument);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				dto.setInstrument(rs.getString("instrument"));
			}
			rs.beforeFirst();
			
			while(rs.next()) {
				String name = rs.getString("art_name");
				artName.add(name);
				
				
			}
			dto.setArtName(artName);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	public Integer countArtists() {
		Integer count = 0;
		conn = getConnection();
		sql = "select count(*) from artists";
		try {
			pstmt = conn.prepareStatement(sql);
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
	public void updateReadCount(String num, String tableName) {
		conn = getConnection();
		sql = "update "+ tableName + " set read_count = read_count +1 where art_reg_num = "+num ;
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
	public List<ArtistsDTO> selByInstrument(String instrument) {
		List<ArtistsDTO> list = new ArrayList<ArtistsDTO>();
		conn = getConnection();
		sql = "select "+COLUMNS+""
				+ " from artists"
				+ " where instrument = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, instrument);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ArtistsDTO dto = new ArtistsDTO();
				dto.setArtRegNum(rs.getLong("art_reg_num"));
				dto.setStrProfile(rs.getString("str_profile"));
				Rename re = new Rename();
				String instrmnt = re.InstrumentRename(rs.getString("instrument"));
				dto.setInstrument(instrmnt);
				dto.setMngName(rs.getString("mng_name"));
				dto.setArtName(rs.getString("art_name"));
				dto.setArtSns(rs.getString("art_sns"));
				dto.setReadCount(rs.getLong("read_count"));
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
