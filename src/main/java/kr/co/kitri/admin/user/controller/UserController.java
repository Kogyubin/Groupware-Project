package kr.co.kitri.admin.user.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.kitri.admin.organ.DeptSvc;
import kr.co.kitri.admin.user.service.UserSvc;
import kr.co.kitri.common.SearchVO;
import kr.co.kitri.common.TreeMaker;
import kr.co.kitri.member.vo.MemberVO;



@Controller
public class UserController {
	
	@Autowired
	private UserSvc usvc;
	
	@Autowired
	private DeptSvc deptSvc;
	
	
	/**
     * 사용자관리메인.
     */
	@RequestMapping("/user")

	public String user(HttpSession session, Model model) {
		
	 	List<?> listview   = deptSvc.selectDepartment();

        TreeMaker tm = new TreeMaker();
        String treeStr = tm.makeTreeByHierarchy(listview);
        
        model.addAttribute("treeStr", treeStr);
		
		return "admin/user";
	}
	
	 /**
	  * 사원리스트.
	  */
	
	 
	@RequestMapping(value = "/userList")
    public String popupUsers4Users(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
        popupUsersByDept(request, searchVO, modelMap);
        
        return "admin/userList";
    }    
	
	/**
     * 지정된 부서 사원리스트.
     */
	

	    public String popupUsersByDept(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
	        String deptno = request.getParameter("deptno");
	        searchVO.setSearchExt1(deptno);
	        
	        List<?> listview  = usvc.selectUserListWithDept(searchVO);
	        
	        modelMap.addAttribute("listview", listview);
	        
	        return "sign/popupUsersByDept";
	    }
	
	
	/**
     * 사용자저장.
	 * @throws IOException 
     */
	@RequestMapping("/addUserSave")
	@ResponseBody
	public boolean addUserSave(MemberVO mvo, Model model, HttpServletResponse res) throws IOException {
		System.out.println("addusersave");
		boolean flag = usvc.addUser(mvo);
		

//		PrintWriter out =  res.getWriter();
//		out.println(flag);
		
		return flag;
	}
	
	/**
     * 아이디 중복체크.
     */
}
