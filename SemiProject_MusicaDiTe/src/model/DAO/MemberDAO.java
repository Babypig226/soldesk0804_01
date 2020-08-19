package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.MemberDTO;

public class MemberDAO extends DataBaseInfo {

	final String COLUMNS = "USER_ID, USER_PW, USER_NAME, USER_BIRTH,"
			+ " USER_ADDR, USER_PH1, USER_PH2,  USER_EMAIL, USER_REGIST";
//
//	USER_ID        VARCHAR2(20)  
//	USER_PW        VARCHAR2(200) 
//	USER_NAME      VARCHAR2(40)  
//	USER_BIRTH     TIMESTAMP(6)  
//	USER_ADDR      VARCHAR2(500) 
//	USER_PH1       VARCHAR2(20)  
//	USER_PH2       VARCHAR2(20)  
//	USER_EMAIL     VARCHAR2(200) 
//	USER_REGIST    TIMESTAMP(6)  
//	JOIN_OK        VARCHAR2(500) 

	public Integer memberInsert(MemberDTO dto) {
		Integer i = null;
		conn = getConnection();
		sql = "insert into member ( " + COLUMNS + " )" + "values(?,?,?,?,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setTimestamp(4, dto.getUserBirth());
			pstmt.setString(5, dto.getUserAddr());
			pstmt.setString(6, dto.getUserPh1());
			pstmt.setString(7, dto.getUserPh2());
			pstmt.setString(8, dto.getUserEmail());
			i = pstmt.executeUpdate();
			System.out.println(i + "�� ���Զ�");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}

	public String memberConfirm(String userId) {
		String id = null;
		conn = getConnection();
		sql = " select user_id from member where user_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				id = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return id;
	}

	public Integer memberLoginCk(String userId, String userPw) {
		Integer result = -1;
		conn = getConnection();
		sql = "select user_pw from member where user_id = ? " + " and join_ok is not null";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPw = rs.getString(1);
				if (userPw.equals(dbPw)) {
					result = 1; // 로그인
				} else {
					result = 0; // 비번이 틀렸슴다
				}
			} else {
				result = -1; // 아이디 틀렸을 때
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public List<MemberDTO> memberSelect(int page, int limit, String userId) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		System.out.println(startRow);
		System.out.println(endRow);
		String condition = "";
		if (userId != null)
			condition = " and user_id = ?";
		conn = getConnection();
		sql = " select * " + " from (select rownum rn, " + COLUMNS + " 	 from (select " + COLUMNS + " from member "
				+ " 	 where 1=1 " + condition + " 	 order by USER_REGIST desc))" + " where rn between ? and ? ";
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			if (userId != null) {
				pstmt.setString(1, userId);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			} else {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
//				final String COLUMNS = "USER_ID, USER_PW, USER_NAME, USER_BIRTH,"
//				+ " USER_ADDR, USER_PH1, USER_PH2,  USER_EMAIL, USER_REGIST";
				dto.setUserAddr(rs.getString("User_Addr"));
				dto.setUserBirth(rs.getTimestamp("User_Birth"));
				dto.setUserEmail(rs.getString("User_Email"));

				dto.setUserId(rs.getString("user_id"));
				dto.setUserName(rs.getString("user_name"));
				dto.setUserPh1(rs.getString("user_ph1"));
				dto.setUserPh2(rs.getString("user_ph2"));
				dto.setUserRegist(rs.getTimestamp("User_Regist"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public Integer passUpdate(String userId, String userPw, String newPw) {
		Integer i = 0;
		conn = getConnection();
		sql = " update member " + " set user_pw = ? " + " where user_id = ? and user_pw = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPw);
			i = pstmt.executeUpdate();
			System.out.println(i + "개 비번 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return i;
	}

	public void userMemberDel(String userId, String userPw) {
		conn = getConnection();
		sql = " delete from member where user_id = ? and user_pw = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			int i = pstmt.executeUpdate();
			System.out.println(i + "개 삭제되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void memberUpdate(MemberDTO dto) {
		conn = getConnection();
		sql = " update member " + " set USER_ADDR= ? , USER_PH1= ?, USER_PH2= ?," + "     USER_EMAIL = ?"
				+ "  where user_id = ? and user_pw = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserAddr());
			pstmt.setString(2, dto.getUserPh1());
			pstmt.setString(3, dto.getUserPh2());
			pstmt.setString(4, dto.getUserEmail());
			pstmt.setString(5, dto.getUserId());
			pstmt.setString(6, dto.getUserPw());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개 정보 수정됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public MemberDTO select(String userId) {
		conn = getConnection();
		sql = "select user_name, user_email, user_ph1, user_birth from member where user_id = ?";
		MemberDTO dto = new MemberDTO();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setUserName(rs.getString("user_name"));
				dto.setUserBirth(rs.getTimestamp("user_Birth"));
				dto.setUserEmail(rs.getString("user_email"));
				dto.setUserPh1(rs.getString("user_ph1"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public Integer joinOkUPdate(String email, String joinOk) {
		Integer result = 0;
		conn = getConnection();
		sql = "update member set join_ok = ? " + " where user_email = ? and  join_ok is null";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, joinOk);
			pstmt.setString(2, email);
			result = pstmt.executeUpdate();
			System.out.println(result + "개가 수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public String checkId(String userEmail, String userPh1) {
		conn = getConnection();
		sql = "select user_id from member where user_email = ? and user_ph1 = ?";
		String userId = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userPh1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userId = rs.getString(1);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			close();
		}return userId;
	}
}

