package kr.co.kitri.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.member.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO {
	

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertMember(MemberVO mvo) {
		
		return sqlSession.insert("member.insertMember", mvo);
	}

	@Override
	public int updateMember(MemberVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(MemberVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberVO> selectMembers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectIdofMember(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectSigninMember(MemberVO mvo) {
		return sqlSession.selectOne("member.selectSigninMember", mvo);
	}

}
