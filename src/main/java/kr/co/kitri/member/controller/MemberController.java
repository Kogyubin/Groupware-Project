package kr.co.kitri.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.kitri.member.service.MemberSvc;
import kr.co.kitri.member.vo.MemberVO;


@Controller
public class MemberController {
	//test
	@Autowired
	private MemberSvc msvc;
	
	 /**
     * 로그인화면.
     */
	@RequestMapping("/")
	public String singIn() {
		System.out.println("/signin");
		return "member/sign-in";
	}
	
	 /**
     * 로그인처리.
     */
	@RequestMapping("/sign-in")
	public String signIn(@RequestParam("username") String id, @RequestParam("password") String pw, Model model,
			HttpSession session) {
		
		MemberVO mvo = new MemberVO();
		mvo.setEmp_id(id);
		mvo.setEmp_pw(pw);
		
		boolean flag = msvc.signIn(mvo);
		
		if(flag) {//로그인 성공
			session.setAttribute("session_id", id);
			
		}
		model.addAttribute("flag", flag);
		
		return "member/sign-in-ok";
		
	}
	
	/**
     * 로그아웃.
     */
	@RequestMapping("/sign-out")
	public String signOut(HttpSession session, Model model) {
		System.out.println("/signout");
		
		if(session.getAttribute("session_id")!=null) {
			session.removeAttribute("session_id");
		}
		
		return "redirect:/";
	}
	
	
	

}
