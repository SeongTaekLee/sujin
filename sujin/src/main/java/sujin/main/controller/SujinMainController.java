package sujin.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sujin.common.common.CommandMap;
import sujin.main.service.SujinMainService;

@Controller
public class SujinMainController {
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="mainService")
	private SujinMainService mainService;
	
	@RequestMapping(value="/main/sujinMain.do")
	public String mainController (CommandMap commandMap) throws Exception{
		
		
		return "/main/sujinMain";
	}
	
	@RequestMapping(value="/main/getChartData.do")
	@ResponseBody
	public Map<String, Object> getChartData(CommandMap commandMap) throws Exception{
		log.info("============== getChartData.do  dateType : "+commandMap.get("DATE_TYPE"));
		log.info("============== getChartData.do  chartType : "+commandMap.get("CHART_TYPE"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(commandMap.get("DATE_TYPE") == null || "".equals(commandMap.get("DATE_TYPE")))   commandMap.put("DATE_TYPE", "daily"); //날짜 기본값 세팅
		if(commandMap.get("CHART_TYPE") == null || "".equals(commandMap.get("CHART_TYPE"))) commandMap.put("CHART_TYPE", "pie");
		// daily weekly monthly
		//값 세팅
		
		
		List<Map<String, Object>> list	= mainService.getChartData(commandMap.getMap());
		
		map.put("chartData", list);
		log.info("-------------------------------------------------------- "+commandMap.get("DATE_TYPE"));
		return map;
	}
	
}
