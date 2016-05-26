package sujin.main.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sujin.main.dao.FoodDAO;

@Service("foodService")
public class FoodServiceImpl implements FoodService{
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="foodDAO")
	private FoodDAO foodDAO;
	
	@Override
	public void insertFood(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		foodDAO.insertFood(map);
	}
}
