package org.duckoo.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/kyb")
public class KybController {

	 @GetMapping("test")
	 @ResponseBody
	 public Map<String ,String> test(){
		Map<String ,String> ret= new HashMap<String, String>();
		ret.put("µé¾î°¡¶ù ", "¾å");
		return ret; 
	 }
	
}
