package sujin.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter{
	Logger log = Logger.getLogger(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		try {
			
			/*if (request.getSession().getAttribute("user") == null && request.getRequestURI().contains("/login.do") )  {
				log.info("===== 최초 로그인 시,  URI : "+request.getRequestURI());
				return true;
				
			}*/
			
			if(request.getSession().getAttribute("user") != null){
				
				if(request.getRequestURI().contains("/login.do")){ //세션있고 로그인 페이지 이동
					log.info("========================= 세션있고 로그인 페이지 이동");
					response.sendRedirect("/sujin/main/sujinMain.do");
					return false;
				}else{ //세션있고 기타 페이지 이동
					log.info("========================= 세션 있고 기타페이지 이동");
					return true;
				}
				
			}else{ 
				
				if(request.getRequestURI().contains("/submitLogin.do") || request.getRequestURI().contains("/login.do")){
					log.info("========================= 세션 없고 로그인페이지 이동");
					return true;
				}else{
					log.info("========================= 세션 없고 기타페이지 이동");
					response.sendRedirect("/sujin/main/login.do");
					return false;
				}
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		super.postHandle(request, response, handler, modelAndView);
	}
}
