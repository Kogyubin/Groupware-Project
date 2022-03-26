package kr.co.kitri.admin.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kitri.common.SearchVO;
import kr.co.kitri.member.dao.MemberDAO;
import kr.co.kitri.member.vo.MemberVO;

@Service
public class UserSvcImpl implements UserSvc {
	
	@Autowired
	private MemberDAO mdao;

	@Override
	public boolean addUser(MemberVO mvo) {
		int result = mdao.insertMember(mvo);
		boolean flag = false;
		if(result==0) {
			flag=false;
		}else {
			flag=true;
		}
		
		return flag;
	
	}

	@Override
	public List<?> selectUserListWithDept(SearchVO param) {
		return mdao.selectUserListWithDept(param);
	}

	@Override
	public MemberVO selectUserOne(int emp_no) {
		return mdao.selectUserOne(emp_no);
	}

	@Override
	public boolean deleteUser(int emp_no) {
		int result = mdao.deleteUser(emp_no);
		boolean flag = false;
		if(result==0) {
			flag=false;
		}else {
			flag=true;
		}
		
		return flag;
		
	}

//	@Override
//	public void addUser(MemberVO mvo) {
//		if (Integer.toString(mvo.getEmp_no()) == null || "".equals(mvo.getEmp_no())) {
//				mdao.insertMember(mvo);
//			}else {
//				mdao.updateUser(mvo);
//			}
//		
//	}

	@Override
	public String selectUserID(String emp_id) {
		
		return mdao.selectUserID(emp_id);
	}
	

}
