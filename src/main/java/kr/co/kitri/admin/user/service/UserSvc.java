package kr.co.kitri.admin.user.service;

import java.util.List;

import kr.co.kitri.common.SearchVO;
import kr.co.kitri.member.vo.MemberVO;

public interface UserSvc {
	
	public boolean addUser(MemberVO mvo);
	public List<?> selectUserListWithDept(SearchVO param);
	
}
