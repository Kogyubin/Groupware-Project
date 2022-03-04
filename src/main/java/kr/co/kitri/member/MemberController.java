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
		return "views/member/sign-in";
	}
	
	@RequestMapping("/signin-2")
	public String singIn2() {
		System.out.println("test2");
		return "views/member/sign-in";
	}
	@RequestMapping("/signin-3")
	public String singIn3() {
		System.out.println("test3");
		return "views/member/sign-in";
	}
	
	@RequestMapping("/signin-4")
	public String singIn4() {
		System.out.println("나도 한글 올라가지나");
		System.out.println("success");
		System.out.println("success");
		return "views/member/sign-in";
	}
	
	

}
