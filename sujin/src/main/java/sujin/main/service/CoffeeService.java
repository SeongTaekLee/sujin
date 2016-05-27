package sujin.main.service;

import java.util.List;
import java.util.Map;

public interface CoffeeService {


	void inputCFSave(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getCoffeeList(Map<String, Object> map) throws Exception;

	void delCoffeeList(String cF_CD) throws Exception;

	void updateCoffeeList(Map<String, Object> map) throws Exception;

}
