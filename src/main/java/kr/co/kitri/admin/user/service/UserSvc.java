package kr.co.kitri.admin.user.service;

import java.util.List;
import kr.co.kitri.common.SearchVO;
import kr.co.kitri.member.vo.MemberVO;

public interface UserSvc {
	
	public boolean addUser(MemberVO mvo);
	public List<?> selectUserListWithDept(SearchVO param);
	public MemberVO selectUserOne(int emp_no);
	public String selectUserID(String emp_id);
	public boolean updateUser(MemberVO mvo);
	public boolean deleteUser(int emp_no);
	
}
