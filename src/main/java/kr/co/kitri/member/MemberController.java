package kr.co.kitri.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@Autowired
	private MemberSvc msvc;
	
	@RequestMapping("/signin")
	public String singIn() {
		System.out.println("/signin");
		return "member/sign-in";
	}
	
	//테스트
	

}
