package sujin.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sujin.main.dao.BodyCheckDAO;

@Service("bodyCheckService")
public class BodyCheckServiceImpl implements BodyCheckService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="bodyCheckDAO")
	private BodyCheckDAO bodyCheckDAO;
	
	@Override
	public List<Map<String, Object>> getBodyCheckList() throws Exception {
		// TODO Auto-generated method stub
		return bodyCheckDAO.getBodyCheckList();
	}
	
	@Override
	public void inputBodyCheck(Map<String, Object> map) throws Exception {
		log.info("============================================================= "+map.toString());
		
		bodyCheckDAO.inputBodyCheck(map);
	}
	
	@Override
	public List<Map<String, Object>> getCdList() throws Exception {
		// TODO Auto-generated method stub
		return bodyCheckDAO.getCDList();
	}
	
	@Override
	public List<Map<String, Object>> getTodayValue() throws Exception {
		// TODO Auto-generated method stub
		return bodyCheckDAO.getTodayValue();
	}
	
	@Override
	public List<Map<String, Object>> getChartData(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		return bodyCheckDAO.getChartData(map);
	}
	
	
}
