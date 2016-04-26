package sujin.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sujin.common.common.CommandMap;
import sujin.main.service.CounselService;

@Controller
public class CounselController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="counselService")
	private CounselService counselService;
	
	@RequestMapping(value="/main/counsel.do")
	public ModelAndView counselController(CommandMap commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("/main/counsel");
		
		List<Map<String, Object>> list = counselService.selectCounselList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
}
