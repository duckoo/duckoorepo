package org.duckoo.web;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@GetMapping("/index1")
	public void getIndex1(){
		
	}
	@PostMapping("/index1")
	public void getIndex(HttpSession session){
/*		Cookie[] cookie = request.getCookies();
		HttpSession session = request.getSession();
		if(cookie==null){
			
		}else{
			for(int i=0; i<cookie.length; i++){
				if(cookie[i].getName().equals("G_AUTHUSER_H")){
						response.addCookie(cookie[i]);					
						session.setAttribute("cookie", cookie);
						//response.sendRedirect("/sql/testMinwoo");
						System.out.println(cookie);
				}
			}
			
			return "redirect:/sql/testMinwoo";
		}
		System.out.println("메인 구글 쿠키 없다");
		return "redirect:/main/index1";*/
	}
	
	
}
