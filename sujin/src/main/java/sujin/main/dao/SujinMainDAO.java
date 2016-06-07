package sujin.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;

@Repository("mainDAO")
public class SujinMainDAO extends AbstractDAO{
	Logger log = Logger.getLogger(getClass());


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getChartData(Map<String, Object> map) throws Exception{
		
		if     ("pie" .equals(map.get("CHART_TYPE")) ) return selectList("main.getPieChartData",  map);
		else if("bar" .equals(map.get("CHART_TYPE")) ) return selectList("main.getBarChartData",  map);
		else if("line".equals(map.get("CHART_TYPE")) ) return selectList("main.getLineChartData", map);
		
		
		return selectList("main.getPieChartData", map);
	}
	
	public String getMainBodySummary() throws Exception{
		// TODO Auto-generated method stub
		return (String) selectOne("main.getMainBodySummary");
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getMainFoodSummary() throws Exception{
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = selectList("main.getMainFoodSummary");
		if(list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getMainCoffeeSummary() throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = selectList("main.getMainCoffeeSummary");
		if(list.size() == 0){
			return null;
		}
		return list.get(0);
	}

	public String getMainDiarySummary() throws Exception{
		// TODO Auto-generated method stub
		return (String) selectOne("main.getMainDiarySummary");
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getMainCounselSummary() throws Exception{
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = selectList("main.getMainCounselSummary");
		if(list.size() == 0){
			return null;
		}
		return list.get(0);
	}

}
