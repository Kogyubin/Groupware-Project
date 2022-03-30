package kr.co.kitri.admin.organ;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.co.kitri.common.TreeMaker;


@Controller
public class DeptController {
	
	@Autowired
	private DeptSvc deptSvc;
	
	
	/**
     * 부서리스트.
     */
	
	@RequestMapping("/dept")

	public String dept(HttpSession session, Model model) {
		
	 	List<?> listview  = deptSvc.selectDepartment();

        TreeMaker tm = new TreeMaker();
        String treeStr = tm.makeTreeByHierarchy(listview);
        
        model.addAttribute("treeStr", treeStr);
		
		return "admin/dept";
	}
	

	/**
     * 부서등록.
     */
	@RequestMapping("/deptSave")
	@ResponseBody
	public boolean deptSave(HttpServletResponse response, DepartmentVO deptvo) {
		
		boolean flag = deptSvc.insertDepartment(deptvo);
		return flag;
	}

	/**
     * 부서하나 클릭.
     */
	
	@RequestMapping("/deptRead")
	@ResponseBody
	public DepartmentVO deptRead(String deptnm) {
		
		DepartmentVO deptvo = deptSvc.selectDepartmentOne(deptnm);
		return deptvo;
		
	}
}
