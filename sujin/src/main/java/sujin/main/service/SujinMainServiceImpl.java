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
	public void mainDummy(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mainDAO.mainDummy(map);
	}
	
	@Override
	public List<Map<String, Object>> getChartData(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.getChartData(map);
	}
}
