package org.duckoo.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
    boolean setErdPageJSON(@RequestBody Map<String,Object> jsons){
		System.out.println(jsons);
		for (Map.Entry<String, Object> entry : jsons.entrySet()) {
			String key   = entry.getKey();
			Object value =  entry.getValue();
			JSONObject js = new JSONObject(); //잭슨바인더로 인수받아서
			js.put(key,value);// json이라는 라이브러리 추가해서 한거임..
			System.out.println("json:: "+js);
			byte[] jByte=js.toString().getBytes();
			UploadFileUtill ufu=new UploadFileUtill();
			try {
				ufu.uploadFile(uploadPath, "1.txt", jByte);
				//여기서 데이터베이스 처리해야됨..
			} catch (Exception e) {
				System.out.println("FILE ERROR");
				e.printStackTrace();
			}
	    }
		return true;
	}
	
	//@RequestMapping(value="getErdPageJSON",produces="application/text; charset=utf8")
	@RequestMapping(value="getErdPageJSON",produces="application/json")
	List<String> getErdPageJSON(HttpServletResponse response) throws IOException{
		String absoultePath="C:\\zzz\\upload\\2017\\27\\07\\";
		List<String> src=new LinkedList<>();
		List<String> ret= new LinkedList<>();
		//데이터베이스에서 경로 가져와야한다.
		src.add(absoultePath + "3.txt");
		src.add(absoultePath + "2.txt");
		src.add(absoultePath + "5.txt");
		
	   for(int i=0,len = src.size();i<len;i++){
		    File file=new File(src.get(i));
			InputStream  in=null;
			try {	
				in= new FileInputStream(file);
				ret.add(IOUtils.toString(in));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}finally{
				  in.close();
			}
	   }
		log.info("get: "+ret);
	    response.setContentType("text/html;charset=UTF-8");
		return ret;
	 }
	
}
