package kr.co.kitri.signchk.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kitri.common.SearchVO;
import kr.co.kitri.etc.EtcSvc;
import kr.co.kitri.sign.service.SignSvc;

@Controller 
public class SignChkController {

    @Autowired
    private SignSvc signSvc;

    @Autowired
    private EtcSvc etcSvc; 
    
    static final Logger LOGGER = LoggerFactory.getLogger(SignChkController.class);
    
    /**
     * 결제 받을 문서 리스트.
     */
    @RequestMapping(value = "/signListTobe")
    public String signListTobe(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap) {
        // 페이지 공통: alert
//        String empno = request.getSession().getAttribute("empno").toString();
//        
//        etcSvc.setCommonAttribute(empno, modelMap);
//    	
//        // 
//        searchVO.setEmpno(empno);
//        searchVO.pageCalculate( signSvc.selectSignDocTobeCount(searchVO) ); // startRow, endRow
//        List<?> listview  = signSvc.selectSignDocTobeList(searchVO);
//        
//        modelMap.addAttribute("searchVO", searchVO);
//        modelMap.addAttribute("listview", listview);
        
        return "signchk/SignDocListTobe";
    }
    
    
    
}    
