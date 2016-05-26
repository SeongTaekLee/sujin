package sujin.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;


@Repository("foodDAO")
public class FoodDAO extends AbstractDAO{
	Logger log = Logger.getLogger(getClass());
	

	public void insertFood(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		selectOne("food.insertFood", map);
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getBODY_CHECK_LEVEL_CD() throws Exception{
		// TODO Auto-generated method stub
		return selectList("food.getBODY_CHECK_LEVEL_CD");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getFOOD_CONFIRM_CD() throws Exception {
		// TODO Auto-generated method stub
		return selectList("food.getFOOD_CONFIRM_CD");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getFOOD_LV_CD() throws Exception {
		// TODO Auto-generated method stub
		return selectList("food.getFOOD_LV_CD");
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getFoodList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return selectList("food.getFoodList", map);
	}


	public void delFoodList(String FOOD_CD) throws Exception{
		// TODO Auto-generated method stub
		delete("food.delFoodList", FOOD_CD);
	}


	public void updateFoodList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("food.updateFoodList", map);
	}

	
	

}
