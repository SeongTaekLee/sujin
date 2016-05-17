package sujin.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sujin.main.service.BodyCheckDetailService;


@Controller
public class BodyCheckDetailController {
Logger log = Logger.getLogger(this.getClass());
    
	@Resource(name="bodyCheckDetailService")
	private BodyCheckDetailService bodyCheckDetailService;
    
    @RequestMapping(value="/main/bodyCheckDetail.do")
    public ModelAndView bodyCheckDetail() throws Exception{
    	log.info("===== bodyCheckDetail Controller loaded ");
    	ModelAndView mv = new ModelAndView("/main/bodyCheckDetail");
    	
    	/*List<Map<String, Object>> bodyDetailList = bodyCheckDetailService.selectBodyCheckDetail();
    	mv.addObject("bodyDetailList", bodyDetailList);
    	log.debug("===== >>>>> list size"+bodyDetailList.size());*/
    	
    	return mv;
    }
    
    @RequestMapping(value="/main/getBodyCheckDetail.do")
    @ResponseBody
    public Map<String, Object> getBodyCheckDetail() throws Exception{
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<Map<String, Object>> list = bodyCheckDetailService.selectBodyCheckDetail();
    	List<Map<String, Object>> thList = bodyCheckDetailService.getThList();
    	
    	map.put("thList", thList);
    	map.put("result", list);
    	
    	return map;
    }
}
