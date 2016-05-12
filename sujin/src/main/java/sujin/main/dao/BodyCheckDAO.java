package sujin.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;


@Repository("bodyCheckDAO")
public class BodyCheckDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getBodyCheckList(Map<String, Object> map ) throws Exception{
		// TODO Auto-generated constructor stub
		
		return (List<Map<String, Object>>)selectList("bodyCheck.getBodyCheck", map);
	}
	
}
