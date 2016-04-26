package sujin.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;

@Repository("counselDAO")
public class CounselDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCounselList(Map<String, Object> map){
		return List<Map<String,Object>>selectList("counsel.selectCounselList", map);
	}

}
