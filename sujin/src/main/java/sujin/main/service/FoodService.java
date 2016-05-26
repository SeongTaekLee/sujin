package sujin.main.service;

import java.util.List;
import java.util.Map;

public interface FoodService {

	void insertFood(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getFOOD_CONFIRM_CD() throws Exception;

	List<Map<String, Object>> getFOOD_LV_CD() throws Exception;

	List<Map<String, Object>> getBODY_CHECK_LEVEL_CD() throws Exception;

	List<Map<String, Object>> getFoodList(Map<String, Object> map) throws Exception;

	String delFoodList(String FOOD_CD) throws Exception;

	void updateFoodList(Map<String, Object> map) throws Exception;

	

}
