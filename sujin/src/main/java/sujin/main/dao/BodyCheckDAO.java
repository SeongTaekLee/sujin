package sujin.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;


@Repository("bodyCheckDAO")
public class BodyCheckDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getBodyCheckList() throws Exception{
		// TODO Auto-generated constructor stub
		
		return selectList("bodyCheck.getBodyCheck");
	}
	
	public void inputBodyCheck(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		log.info(" ****************** DAO : "+map.toString());
		update("bodyCheck.mergeBodyCheck", map);
	}
	
}
