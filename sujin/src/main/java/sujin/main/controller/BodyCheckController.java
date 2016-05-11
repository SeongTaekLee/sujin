package sujin.main.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		ModelAndView mv = new ModelAndView("");
	}
}
