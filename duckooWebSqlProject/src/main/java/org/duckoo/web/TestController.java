package org.duckoo.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sql")
public class TestController {
	

	@GetMapping("/erdMain")
	public void re1(){
		
	}
	@GetMapping("/test")
	public void re2(){
		
	}
	@GetMapping("/testTaebong")
	public void re3(){
		
	}
	@GetMapping("/testMinwoo")
	public void re4(){
		System.out.println("테스트민우222222");
	}
	
}
