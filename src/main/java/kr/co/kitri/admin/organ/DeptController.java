package kr.co.kitri.admin.organ;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
