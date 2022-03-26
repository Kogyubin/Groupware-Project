package kr.co.kitri.etc;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import kr.co.kitri.signboardsearch.vo.BoardSearchVO;

@Service
public class EtcSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    

    public void setCommonAttribute(String param, ModelMap modelMap) {
        Integer alertcount = sqlSession.selectOne("selectAlertCount", param);
        modelMap.addAttribute("alertcount", alertcount);    	
    }

    public Integer selectAlertCount(String param) {
        return sqlSession.selectOne("selectAlertCount", param);
    }
    
    public List<?> selectAlertList4Ajax(String param) {
        return sqlSession.selectList("selectAlertList4Ajax", param);
    }

    public List<?> selectAlertList(String param) {
        return sqlSession.selectList("selectAlertList", param);
    }
    
    public Integer selectList4UserCount(BoardSearchVO param) {
        return sqlSession.selectOne("selectList4UserCount", param);
    }
    
    public List<?> selectList4User(BoardSearchVO param) {
        return sqlSession.selectList("selectList4User", param);
    }
    
    public List<?> selectClassCode(String param) {
        return sqlSession.selectList("selectClassCode", param);
    }
    
}
