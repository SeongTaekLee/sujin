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
import sujin.main.service.CoffeeService;


@Controller
public class CoffeeController {
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="coffeeService")
	private CoffeeService coffeeService;
	
	@RequestMapping(value="/main/coffee.do")
	public String coffeeController() throws Exception{
		
		
		
		return "/main/coffee"; 
	}
	
	@RequestMapping(value="/main/inputCFSave.do")
	@ResponseBody
	public String inputCFSave (CommandMap commandMap) throws Exception{
		log.info("commandMap : "+commandMap.toString());
		coffeeService.inputCFSave(commandMap.getMap());
		return "success";
	}
	
	@RequestMapping(value="/main/getCoffeeList.do")
	@ResponseBody
	public Map<String, Object> getCoffeeList(CommandMap commandMap) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = coffeeService.getCoffeeList(commandMap.getMap());
		
		map.put("coffeeList", list);
		
		return map;
	}
	
	@RequestMapping(value="/main/delCoffeeList.do")
	@ResponseBody
	public String delCoffeeList(@RequestParam("CF_CD") String CF_CD) throws Exception{
		
		coffeeService.delCoffeeList(CF_CD);
		
		return "success";
	}
	
	@RequestMapping(value="/main/updateCoffeeList.do")
	@ResponseBody
	public String updateCoffeeList(CommandMap commandMap) throws Exception{
		
		coffeeService.updateCoffeeList(commandMap.getMap());
		
		return "success";
	}
	
	
}
