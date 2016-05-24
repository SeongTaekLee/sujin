package sujin.main.service;

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
	public void dummy() throws Exception {
		// TODO Auto-generated method stub
		coffeeDAO.dummy();
	}

}
