package sujin.main.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sujin.common.common.CommandMap;
import sujin.main.service.FoodService;

@Controller
public class FoodController {
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="foodService")
	private FoodService foodService;
	
	@RequestMapping(value="/main/food.do")
	public String foodController() throws Exception{
		log.info("============== food Controller");
		
		return "/main/food";
	}
	
	@RequestMapping(value="/main/insertFood.do")
	public Map<String, Object> saveFood(CommandMap commandMap) throws Exception{
		log.info("save Food loaded");
		log.info("CommandMap : "+commandMap.toString());
		
		if(commandMap.get("MENU2") == null){commandMap.put("MENU2", "");}
		if(commandMap.get("MENU3") == null){commandMap.put("MENU3", "");}
		if(commandMap.get("MENU4") == null){commandMap.put("MENU4", "");}
		if(commandMap.get("MENU5") == null){commandMap.put("MENU5", "");}
		if(commandMap.get("MENU6") == null){commandMap.put("MENU6", "");}
		if(commandMap.get("MENU7") == null){commandMap.put("MENU7", "");}
		if(commandMap.get("MENU8") == null){commandMap.put("MENU8", "");}
		if(commandMap.get("MENU9") == null){commandMap.put("MENU9", "");}
		
		log.info("CommandMap ::::"+commandMap.toString());
		foodService.insertFood(commandMap.getMap());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", "success");
		
		return map;
		
	}
}
