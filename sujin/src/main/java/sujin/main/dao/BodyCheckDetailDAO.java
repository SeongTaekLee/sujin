package sujin.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;

@Repository("bodyCheckDetailDAO")
public class BodyCheckDetailDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBodyCheckDetail() throws Exception{
		
		return selectList("bodyCheckDetail.selectBodyCheckDetail");
		
	}
	

}
