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
		
		model.put("results", list);
		//model.put("success", "sucess");
		return model;
	}
	
	@RequestMapping(value="/main/bodyCheckSubmit.do")
	@ResponseBody
	public String  inputBodyCheckController(HttpServletRequest request, CommandMap commandMap) throws Exception{
		// ajax 쓸때는 꼭 @ResponseBody 를 사용하고 success를 리턴해준다.!!!!!!!!!!!!!!!!!!!!!!!!!!
		//Map map = new HashMap();
		log.info("---------> bodyCheckSubmit controller json : "+commandMap.toString());
		bodyCheckService.inputBodyCheck(commandMap.getMap());
		
		//request.setAttribute("result","success");
		//map.put("result", "success");
		//return map;
		//return mv;
		return "success";
		
	}
}
