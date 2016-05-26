package sujin.main.dao;

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

}
