package sujin.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
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
		log.info("======= controller ended");
		return map;
		
	}
	
	@RequestMapping(value="/main/getFoodCodeList.do")
	@ResponseBody
	public Map<String, Object> getFoodCodeList() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> FOOD_CONFIRM     = foodService.getFOOD_CONFIRM_CD();
		List<Map<String, Object>> FOOD_LV          = foodService.getFOOD_LV_CD();
		List<Map<String, Object>> BODY_CHECK_LEVEL = foodService.getBODY_CHECK_LEVEL_CD();
		map.put("FOOD_CONFIRM", 	FOOD_CONFIRM);
		map.put("FOOD_LV", 			FOOD_LV);
		map.put("BODY_CHECK_LEVEL", BODY_CHECK_LEVEL);
		return map;
	}
	
	@RequestMapping(value="/main/getFoodList.do")
	@ResponseBody
	public Map<String, Object> getFoodList(CommandMap commandMap) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = foodService.getFoodList(commandMap.getMap());
		
		map.put("foodList", list);
		
		return map;
	}
	
	@RequestMapping(value="/main/delFoodList.do")
	@ResponseBody
	public String delFoodList(@RequestParam("FOOD_CD") String FOOD_CD ) throws Exception{
		log.info("============ del Food List food_cd = "+FOOD_CD);
		
		String flag = foodService.delFoodList(FOOD_CD);
		
		return flag;
	}
	
	@RequestMapping(value="/main/updateFoodList.do")
	@ResponseBody
	public String updateFoodList(CommandMap commandMap) throws Exception{
		log.info("================= updateFoodList commandMap = "+commandMap.toString());
		
		foodService.updateFoodList(commandMap.getMap());
		
		return "success";
	}
	
	
	
	
}
