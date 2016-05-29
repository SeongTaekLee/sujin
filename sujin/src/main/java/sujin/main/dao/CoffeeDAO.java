package sujin.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;

@Repository("coffeeDAO")
public class CoffeeDAO extends AbstractDAO{
	Logger log = Logger.getLogger(getClass());
	
	
	
	public void inputCFSave(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		insert("coffee.inputCFSave", map);
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getCoffeeList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return selectList("coffee.getCoffeeList", map);
	}


	public void delCoffeeList(String CF_CD) throws Exception{
		// TODO Auto-generated method stub
		delete("coffee.delCoffeeList", CF_CD);
	}


	public void updateCoffeeList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("coffee.updateCoffeeList", map);
	}

}
