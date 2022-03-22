package kr.co.kitri.member.dao;

import java.util.List;

import kr.co.kitri.member.vo.MemberVO;

public interface MemberDAO {
	
	public int insertMember(MemberVO mvo);
	public int updateMember(MemberVO mvo);
	public int deleteMember(MemberVO mvo);
	public List<MemberVO> selectMembers();
	public int selectIdofMember(String id);
	public int selectSigninMember(MemberVO mvo);
}
