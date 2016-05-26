package sujin.main.service;

import java.util.List;
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
	
	@Override
	public List<Map<String, Object>> getBODY_CHECK_LEVEL_CD() throws Exception {
		// TODO Auto-generated method stub
		return foodDAO.getBODY_CHECK_LEVEL_CD();
	}
	
	@Override
	public List<Map<String, Object>> getFOOD_CONFIRM_CD() throws Exception {
		// TODO Auto-generated method stub
		return foodDAO.getFOOD_CONFIRM_CD();
	}
	
	@Override
	public List<Map<String, Object>> getFOOD_LV_CD() throws Exception {
		// TODO Auto-generated method stub
		return foodDAO.getFOOD_LV_CD();
	}
	
	@Override
	public List<Map<String, Object>> getFoodList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return foodDAO.getFoodList(map);
	}
	
	@Override
	public String delFoodList(String FOOD_CD) throws Exception {
		// TODO Auto-generated method stub
		
		foodDAO.delFoodList(FOOD_CD);
		return "success";
	}
	
	@Override
	public void updateFoodList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		foodDAO.updateFoodList(map);
	}
}
