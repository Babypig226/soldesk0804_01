package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MemberDTO;

@Repository
public class MemberRepository {
	@Autowired
	private SqlSession sqlSession;
	private final String namespace="mappers.member.memberMapper";
	private String statement;
	public Integer insertMember(MemberDTO memberDTO) {
		try {
			statement = namespace + ".insertMember";
			return sqlSession.insert(statement, memberDTO);
		} catch (Exception e) {
			return null;
		}
	}
	public Integer joinOkUpdate(MemberDTO memberDTO) {
		statement = namespace + ".joinOkUpdate";
		return sqlSession.update(statement, memberDTO);
	}
	public MemberDTO selectByMember(MemberDTO memberDTO) {
		statement = namespace + ".selectMember";
		return sqlSession.selectOne(statement, memberDTO);
	}
	public List<MemberDTO> getMemberList(MemberDTO memberDTO) {
		statement = namespace +".selectMember";
		return sqlSession.selectList(statement);
	}
	public int getMemberCount() {
		statement = namespace +".memberCount";
		return sqlSession.selectOne(statement);
	}
	public void memberUpdate(MemberDTO memberDTO) {
		statement = namespace +".memberUpdate";
		sqlSession.update(statement, memberDTO);
		
	}
	public void passwordUpdate(MemberDTO memberDTO) {
		statement = namespace + ".passwordUpdate";
		sqlSession.update(statement, memberDTO);
	}
}
