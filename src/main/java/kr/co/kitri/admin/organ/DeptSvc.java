package kr.co.kitri.admin.organ;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeptSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;    
        
    public List<?> selectDepartment() {
        return sqlSession.selectList("selectDepartment");
    }
    
    /**
     * 부서저장.     
     */
    public boolean insertDepartment(DepartmentVO deptvo) {
    	int result = sqlSession.insert("insertDepartment");
		boolean flag = false;
		if(result==0) {
			flag=false;
		}else {
			flag=true;
		}
		
		return flag;
	
	}
 
    public DepartmentVO selectDepartmentOne(String deptnm) {
        return sqlSession.selectOne("selectDepartmentOne", deptnm);
    }

    public void deleteDepartment(String param) {
        sqlSession.delete("deleteDepartment", param);
    }
    
}
