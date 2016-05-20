package sujin.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sujin.common.common.CommandMap;
import sujin.common.vo.UserVO;
import sujin.main.service.DiaryService;

@Controller
public class DiaryController {
	Logger log = Logger.getLogger(getClass());
	
	@Resource(name="diaryService")
	private DiaryService diaryService;
	
	@RequestMapping(value="/main/diary.do")
	public String diaryController(CommandMap commandMap) throws Exception{
		log.info("=============== diary controller loaded ");
		
		return "/main/diary";
	}
	
	@RequestMapping(value="/main/saveDiary.do")
	@ResponseBody
	public Map<String, Object> saveDiary(CommandMap commandMap, HttpSession session) throws Exception{
		log.info("============================ saveDiary Controller loaded");
		
		UserVO user = new UserVO();
		user = (UserVO) session.getAttribute("user");
		
		commandMap.put("WRITER", user.getUserId());
		/*
		UserVO user = new UserVO();
		user = (UserVO) session.getAttribute("user");
		log.info("session :: "+user.toString());
		*/
		diaryService.saveDiary(commandMap.getMap());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SUCCESS", "SUCCESS");
		return map;
		
	}
	
	@RequestMapping(value="/main/getDiaryList.do")
	@ResponseBody
	public Map<String, Object> getDiaryList(CommandMap commandMap) throws Exception{
		log.info("==================== getDiaryList Controller loaded");
		
		log.info("------ MAP : "+commandMap.toString());
		
		
		List<Map<String, Object>> list = diaryService.getDiaryList(commandMap.getMap());
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", list);
		
		return result;
	}
	

}
