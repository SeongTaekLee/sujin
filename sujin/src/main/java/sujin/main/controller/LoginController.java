package sujin.main.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sujin.common.common.CommandMap;
import sujin.common.vo.UserVO;
import sujin.main.service.LoginService;

@Controller
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
    
	@Resource(name="loginService")
	private LoginService loginService;
    
	
	/*@RequestMapping(value="/main/loginPage.do")
	public String loginPage() throws Exception{
		log.info("===== loginPage Controller ");
		return "/main/login";
	}*/
	
    @RequestMapping(value="/main/login.do")
    public String login(CommandMap commandMap, HttpSession session) throws Exception{ 
    	
    	log.info("===== login Controller commandMap : "+commandMap.toString());
    	String uri = "/main/login";
    	
    	try {
    		
    		if( session != null ) {
    			uri = "/main/bodyCheck";
    		} else {
    			uri = "/main/login";
    		} 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    	return uri;
    }
    
    @RequestMapping(value="/main/submitLogin")
    public ModelAndView submitLogin(CommandMap commandMap, HttpSession session) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	
    	UserVO user = new UserVO();
    	String uri = "/main/login";
    	
    	if ( commandMap.isEmpty() ) {
    		uri = "/main/login";
    	}else { 
    		Map<String, Object> map = loginService.checkUser(commandMap.getMap());
    		
    		if( Integer.parseInt(map.get("checkUser").toString()) > 0 ){
    			user.setLoginCondition(true);
    			user.setUserId(commandMap.get("userId").toString());
    			session.setAttribute("user", user);
    			uri = "/main/bodyCheck";
    		}else{
    			uri = "/main/login";
    		}
    	}
    	mv.setViewName(uri);
    	
    	return mv;
    }
    
    @RequestMapping(value="/main/logout.do")
    public String logout(HttpSession session) throws Exception{
    	log.info("===== logout Controller loaded");
    	
    	session.invalidate();
    	
    	return "/main/login";
    }
}

