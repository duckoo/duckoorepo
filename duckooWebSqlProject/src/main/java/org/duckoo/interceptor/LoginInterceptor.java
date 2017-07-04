package org.duckoo.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	
	private static final String LOGIN = "login";

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++){
		System.out.println("어디보자"+i+": "+cookies[i].getName());
		}
		session.setAttribute(LOGIN, cookies);
		
		Object dest = session.getAttribute("dest");
		System.out.println("dest: "+(String)dest);
		response.sendRedirect(dest!=null?(String)dest:"/sql/testMinwoo");
	    
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN)!=null){
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	
}
