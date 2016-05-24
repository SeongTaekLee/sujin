package sujin.main.dao;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import sujin.common.dao.AbstractDAO;

@Repository("coffeeDAO")
public class CoffeeDAO extends AbstractDAO{
	Logger log = Logger.getLogger(getClass());
	
	
	
	public void dummy() {
		// TODO Auto-generated method stub
		selectOne("coffee.dummy");
	}

}
