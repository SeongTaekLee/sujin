package sujin.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sujin.common.common.CommandMap;
import sujin.main.service.BodyCheckService;

@Controller
public class BodyCheckController {
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="bodyCheckService")
	private BodyCheckService bodyCheckService;
	
	@RequestMapping(value="/main/bodyCheck.do")
	public ModelAndView bodyCheckController(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/main/bodyCheck");
		
		//List<Map<String, Object>> list = bodyCheckService.getBodyCheckList(commandMap.getMap());
		//mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value="/main/getBodyCheck.do")
	@ResponseBody 
	public Map<String,Object>  getBodyCheckController() throws Exception{
		log.info("========= ajax getBodyCheck.do controller");
		Map<String,Object> model = new HashMap<String,Object>();
		
		List<Map<String, Object>> list = bodyCheckService.getBodyCheckList();
		
		List<Map<String, Object>> cdList = bodyCheckService.getCdList();
		
		model.put("cdList", cdList);
		model.put("results", list);
		//model.put("success", "sucess");
		return model;
	}
	
	@RequestMapping(value="/main/bodyCheckSubmit.do")
	@ResponseBody
	public Map<String, Object>  inputBodyCheckController(HttpServletRequest request, CommandMap commandMap) throws Exception{
		// ajax 쓸때는 꼭 @ResponseBody 를 사용하고 success를 리턴해준다.!!!!!!!!!!!!!!!!!!!!!!!!!!
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("---------> bodyCheckSubmit controller json : "+commandMap.toString());
		bodyCheckService.inputBodyCheck(commandMap.getMap());
		map.put("success", "success");
		
		//request.setAttribute("result","success");
		//map.put("result", "success");
		//return map;
		//return mv;
		return map;
		
	}
	
	@RequestMapping(value="/main/getTodayValue.do")
	@ResponseBody
	public Map<String, Object> getTodayValue() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = bodyCheckService.getTodayValue();
		
		map.put("todayValue", list);
		
		return map;
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
		
		
		List<Map<String, Object>> list	= bodyCheckService.getChartData(commandMap.getMap());
		
		map.put("chartData", list);
		log.info("-------------------------------------------------------- "+commandMap.get("DATE_TYPE"));
		return map;
	}
}
