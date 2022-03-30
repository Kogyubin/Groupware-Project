package kr.co.kitri.sign.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.kitri.admin.organ.UserSvc;
import kr.co.kitri.common.SearchVO;
import kr.co.kitri.admin.organ.*;
import kr.co.kitri.common.TreeMaker;





@Controller
public class SignDetailController {
	
	 @Autowired
	    private DeptSvc deptSvc;
	 
	 @Autowired
	    private UserSvc userSvc;
	
	private static final Logger logger = LoggerFactory.getLogger(SignDetailController.class);
	
	@RequestMapping(value = "/signdetail", method = RequestMethod.GET)
	public String signdetail(Locale locale, Model model) {
		
		return "sign/signdetail";
	}
	
	 @RequestMapping(value = "/popupUser")
	    public String popupUser(ModelMap modelMap) {
		 	List<?> listview   = deptSvc.selectDepartment();

	        TreeMaker tm = new TreeMaker();
	        String treeStr = tm.makeTreeByHierarchy(listview);
	        
	        modelMap.addAttribute("treeStr", treeStr);
	        
	        return "sign/popupUser";
	    }
		 
	 
	 
	 	@RequestMapping(value = "/popupDept")
	     public String popupDept(ModelMap modelMap) {
	      List<?> listview   = deptSvc.selectDepartment();
	
	      TreeMaker tm = new TreeMaker();
	      String treeStr = tm.makeTreeByHierarchy(listview);
	      
	      modelMap.addAttribute("treeStr", treeStr);
	      
	      return "sign/popupDept";
	  }
	
	    @RequestMapping(value = "/popupUsersByDept")
	    public String popupUsersByDept(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
	        String deptno = request.getParameter("deptno");
	        searchVO.setSearchExt1(deptno);
	        
	        List<?> listview  = userSvc.selectUserListWithDept(searchVO);
	        
	        modelMap.addAttribute("listview", listview);
	        
	        return "sign/popupUsersByDept";
	    }
	    
	    
	    @RequestMapping(value = "/popupUsers4Users")
	    public String popupUsers4Users(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
	        popupUsersByDept(request, searchVO, modelMap);
	        
	        return "sign/popupUsers4Users";
	    }    
	
	
	    @RequestMapping(value = "/popupUsers4SignPath")
	    public String popupUsers4SignPath(ModelMap modelMap) {
	        popupUser(modelMap);
	        
	        return "sign/popupUsers4SignPath";
	    }
	    
	    @RequestMapping(value = "/calender")
	    public String calender(ModelMap modelMap) {
	        
	        return "common/calendar";
	    }
	    
	    

}
