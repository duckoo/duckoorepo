package org.duckoo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/hi")
public class HiController {
	
	@RequestMapping(value = "/op", method = RequestMethod.GET)
	public void tt(){
		System.out.println("ㅅㅅㅅㅅㅅ");
		System.out.println("ddddd");
		System.out.println("아옹 ㅚㄴㅁ어ㅘㅇ나");
		
	}
}
