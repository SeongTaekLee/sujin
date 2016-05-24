package sujin.main.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sujin.main.service.FoodService;

@Controller
public class FoodController {
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="foodService")
	private FoodService foodService;
	
	@RequestMapping(value="/main/food.do")
	public String foodController() throws Exception{
		log.info("============== food Controller");
		
		foodService.dummy();
		
		return "/main/food";
	}
}
