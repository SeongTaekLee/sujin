package sujin.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sujin.main.dao.CoffeeDAO;


@Service("coffeeService")
public class CoffeeServiceImpl implements CoffeeService{
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="coffeeDAO")
	private CoffeeDAO coffeeDAO;
	
	
	@Override
	public void inputCFSave(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		coffeeDAO.inputCFSave(map);
	}
	
	@Override
	public List<Map<String, Object>> getCoffeeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return coffeeDAO.getCoffeeList(map);
	}
	
	@Override
	public void delCoffeeList(String CF_CD) throws Exception {
		// TODO Auto-generated method stub
		coffeeDAO.delCoffeeList(CF_CD);
	}
	
	@Override
	public void updateCoffeeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		coffeeDAO.updateCoffeeList(map);
	}

}
