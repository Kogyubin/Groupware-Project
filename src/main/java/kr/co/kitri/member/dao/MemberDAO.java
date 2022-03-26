package kr.co.kitri.member.dao;

import java.util.List;

import kr.co.kitri.common.SearchVO;
import kr.co.kitri.member.vo.MemberVO;

public interface MemberDAO {
	
	public int insertMember(MemberVO mvo);
	public int updateUser(MemberVO mvo);
	public int deleteUser(int emp_no);
	public List<MemberVO> selectMembers();
	public String selectUserID(String emp_id);
	public int selectSigninMember(MemberVO mvo);
	public List<?> selectUserListWithDept(SearchVO param);
	public MemberVO selectUserOne(int emp_no);
	
}
