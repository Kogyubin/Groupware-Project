package kr.co.kitri.sign.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.kitri.common.TreeMaker;





@Controller
public class SignDetailController {
	
	private static final Logger logger = LoggerFactory.getLogger(SignDetailController.class);
	
	@RequestMapping(value = "/signdetail", method = RequestMethod.GET)
	public String signdetail(Locale locale, Model model) {
		
		return "sign/signdetail";
	}
	
//	 @RequestMapping(value = "/popupUser")
//	    public String popupUser(ModelMap modelMap) {
//		 	List<?> listview   = deptSvc.selectDepartment();
//
//	        TreeMaker tm = new TreeMaker();
//	        String treeStr = tm.makeTreeByHierarchy(listview);
//	        
//	        modelMap.addAttribute("treeStr", treeStr);
//	        
//	        return "sign/popupUser";
//	    }
	 
	
	

}
