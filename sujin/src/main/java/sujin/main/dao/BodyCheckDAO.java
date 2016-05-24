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
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getCDList() throws Exception{
		// TODO Auto-generated method stub
		return selectList("bodyCheck.getCDList");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getTodayValue() throws Exception{
		// TODO Auto-generated method stub
		return selectList("bodyCheck.getTodayValue");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getChartData(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		if     ("pie" .equals(map.get("CHART_TYPE")) ) return selectList("bodyCheck.getPieChartData",  map);
		else if("bar" .equals(map.get("CHART_TYPE")) ) return selectList("bodyCheck.getBarChartData",  map);
		else if("line".equals(map.get("CHART_TYPE")) ) return selectList("bodyCheck.getLineChartData", map);
		
		
		return selectList("bodyCheck.getPieChartData", map);
		
	}

	
	
}
