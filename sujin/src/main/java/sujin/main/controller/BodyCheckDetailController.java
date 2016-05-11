package sujin.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sujin.main.service.BodyCheckDetailService;


@Controller
public class BodyCheckDetailController {
Logger log = Logger.getLogger(this.getClass());
    
	@Resource(name="bodyCheckDetailService")
	private BodyCheckDetailService bodyCheckDetailService;
    
    @RequestMapping(value="/main/bodyCheckDetail.do")
    public ModelAndView bodyCheckDetail() throws Exception{
    	log.info("===== bodyCheckDetail Controller loaded");
    	ModelAndView mv = new ModelAndView("/main/bodyCheckDetail");
    	
    	List<Map<String, Object>> bodyDetailList = bodyCheckDetailService.selectBodyCheckDetail();
    	mv.addObject(bodyDetailList);
    	
    	return mv;
    }
}
