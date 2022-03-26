package kr.co.kitri.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kitri.common.SearchVO;
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
	public int updateUser(MemberVO mvo) {
		
		return sqlSession.insert("member.updateUser", mvo);
	}

	@Override
	public int deleteUser(int emp_no) {
		
		return sqlSession.delete("member.deleteUser", emp_no);
	}

	@Override
	public List<MemberVO> selectMembers() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String selectUserID(String emp_id) {
		
		return sqlSession.selectOne("selectUserID", emp_id);
	}


	@Override
	public int selectSigninMember(MemberVO mvo) {
		return sqlSession.selectOne("member.selectSigninMember", mvo);
	}

	@Override
	public List<?> selectUserListWithDept(SearchVO param) {
		return  sqlSession.selectList("selectUserListWithDept", param);
	}

	@Override
	public MemberVO selectUserOne(int emp_no) {
		return sqlSession.selectOne("member.selectUserOne", emp_no);
	}

	
	
	

}
