package sujin.main.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView diaryController(CommandMap commandMap) throws Exception{
		log.info("=============== diary controller loaded ");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/diary");
		
		List<Map<String, Object>> list = diaryService.getDiaryList();
		mv.addObject("diaryList", list);
		
		return mv;
	}
	
	@RequestMapping(value="/main/saveDiary.do")
	@ResponseBody
	public Map<String, Object> saveDiary(CommandMap commandMap, HttpSession session) throws Exception{
		log.info("============================ saveDiary Controller loaded");
		/*
		  Enumeration se = session.getAttributeNames();
		  
		  while(se.hasMoreElements()){
		   String getse = se.nextElement()+"";
		   System.out.println("@@@@@@@ session : "+getse+" : "+session.getAttribute(getse));
		  }
		 */
		if(session.getAttribute("user") != null) {
			log.info("================== session not null");
			log.info("--------------------------------"+session.getAttribute("user").toString());
			
			UserVO user = new UserVO();
			user = (UserVO) session.getAttribute("user");
			log.info("@@@@@@@@@@@@@@@@@@ "+user.getUserId()+"  @@@@@@@@@@@@@@@  "+user.getLoginCondition());
		}else{
			log.info("-------------------- session null");
		}
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
	

}
