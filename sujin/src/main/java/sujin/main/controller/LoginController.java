package sujin.main.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sujin.common.common.CommandMap;
import sujin.main.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
    
	@Resource(name="loginService")
	private LoginService loginService;
	
    @RequestMapping(value="/main/login.do")
    public ModelAndView openSampleBoardList(CommandMap commandMap) throws Exception{
        
    	String address = null;
    	String flag    = null;
    	
    	
    	if( commandMap.get("inputId") == null || commandMap.get("inputPassword") == null ){
    		address = "/main/login";
    		flag    = "none";
    	}else{
    		
    		Map<String, Object> check = loginService.checkUser(commandMap.getMap());
    		System.out.println(check.toString());
    		if(check.get("CHECK_USER").toString().equals("1")){
    			flag    = "good";
    			address = "/main/counsel";
    		}else{
    			flag    = "error";
    			address = "/main/login";
    		}
    		
    	}
    	ModelAndView mv = new ModelAndView(address);
    	mv.addObject("flag", flag);
    	

    	return mv;
    }
}
