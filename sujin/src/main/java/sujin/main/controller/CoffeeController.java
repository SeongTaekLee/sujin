package sujin.main.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sujin.main.service.CoffeeService;


@Controller
public class CoffeeController {
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="coffeeService")
	private CoffeeService coffeeService;
	
	@RequestMapping(value="/main/coffee.do")
	public String coffeeController() throws Exception{
		
		coffeeService.dummy();
		
		return "/main/coffee";
	}
}
