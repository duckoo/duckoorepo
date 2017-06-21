package org.duckoo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sql")
public class TestController {
	
	
	@GetMapping("/erdMakingPage")
	public void erdPageGet(){
		
	}
	@GetMapping("/erdMakingPageBackUp")
	public void re(){
		
	}
	@GetMapping("/erdMakingPageTaehyun")
	public void re1(){
		
	}
	@GetMapping("/test")
	public void re2(){
		
	}
	@GetMapping("/erdMain")
	public void re3(){
		
	}
	@GetMapping("/editorPage")
	public void re4(){
		
	}
	@PostMapping("/editorPage")
	public void re5(String sql){
		
		System.out.println(sql);
	}
	@GetMapping("/test2")
	public void re6(){
		
	}
	@GetMapping("/test3")
	public void re7(){
		
	}
	@GetMapping("/modal")
	public void go(){
		
	}
}
