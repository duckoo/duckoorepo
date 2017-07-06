package org.duckoo.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.duckoo.util.UploadFileUtill;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/rest")
public class RestCon {

	@Resource(name="uploadPath")
    private	String uploadPath;
	
	private static Logger log= Logger.getLogger(UploadFileUtill.class);
 
	@RequestMapping("setErdPageJSON")
    boolean setErdPageJSON(@RequestBody Map<String,Object> json){
		System.out.println(json);
		JSONObject js = new JSONObject(); //잭슨바인더로 인수받아서
		js.put("json", json);// json이라는 라이브러리 추가해서 한거임..
		System.out.println("json:: "+js);
		byte[] jByte=js.toString().getBytes();
		UploadFileUtill ufu=new UploadFileUtill();
		try {
			ufu.uploadFile(uploadPath, "1.txt", jByte);
		} catch (Exception e) {
			System.out.println("FILE ERROR");
			e.printStackTrace();
		}
		return true;
	}
	@RequestMapping(value="getErdPageJSON",produces="application/text; charset=utf8")
		String getErdPageJSON(HttpServletResponse response) throws IOException{
		String absoultePath="C:\\zzz\\upload\\2017\\27\\06\\b00daf0d-d0eb-4d78-b748-d1e865a664fe_1.txt";
		File file=new File(absoultePath);
		InputStream  in=null;
		String ret= "undefined";
		try {	
			in= new FileInputStream(file);
			ret=IOUtils.toString(in);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}finally{
			  in.close();
		}
		log.info("get: "+ret);
		 response.setContentType("text/html;charset=UTF-8");
		return ret;
	 }
	
	
}
