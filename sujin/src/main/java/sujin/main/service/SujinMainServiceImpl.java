package sujin.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sujin.main.dao.SujinMainDAO;


@Service("mainService")
public class SujinMainServiceImpl implements SujinMainService{
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="mainDAO")
	private SujinMainDAO mainDAO;
	
	
	@Override
	public List<Map<String, Object>> getChartData(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getChartData(map);
	}
	
	@Override
	public String getMainBodySummary() throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getMainBodySummary();
	}
	
	@Override
	public Map<String, Object> getMainFoodSummary() throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getMainFoodSummary();
	}
	
	@Override
	public Map<String, Object> getMainCoffeeSummary() throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getMainCoffeeSummary();
	}
	@Override
	public String getMainDiarySummary() throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getMainDiarySummary();
	}
	
	@Override
	public Map<String, Object> getMainCounselSummary() throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getMainCounselSummary();
	}
}
