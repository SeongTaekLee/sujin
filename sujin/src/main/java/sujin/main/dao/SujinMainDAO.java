package sujin.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;

@Repository("mainDAO")
public class SujinMainDAO extends AbstractDAO{
	Logger log = Logger.getLogger(getClass());

	public void mainDummy(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		selectList("main.mainDummy");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getChartData(Map<String, Object> map) throws Exception{
		
		if     ("pie" .equals(map.get("CHART_TYPE")) ) return selectList("main.getPieChartData",  map);
		else if("bar" .equals(map.get("CHART_TYPE")) ) return selectList("main.getBarChartData",  map);
		else if("line".equals(map.get("CHART_TYPE")) ) return selectList("main.getLineChartData", map);
		
		
		return selectList("main.getPieChartData", map);
	}

}
