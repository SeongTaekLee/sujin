package sujin.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sujin.common.common.CommandMap;
import sujin.main.service.DiaryService;

@Controller
public class DiaryController {
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="diaryService")
	private DiaryService diaryService;
	
	@RequestMapping(value="/main/diary.do")
	public ModelAndView diaryController(CommandMap commandMap) throws Exception{
		log.info("=============== diary controller loaded ");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/diary");
		
		List<Map<String, Object>> list = diaryService.getDiaryList();
		mv.addObject("diaryList", list);
		
		return mv;
	}
	

}
