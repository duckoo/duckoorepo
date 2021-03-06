package org.duckoo.util;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtill {
	
 public static String calPath(String uploadPath){
	 Calendar cal=Calendar.getInstance();
	 String yearPath=File.separator+cal.get(Calendar.YEAR);
	 String monthPath=yearPath+File.separator+cal.get((Calendar.MONTH)+1);
	 String datePath=monthPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.DATE));
	 makeDir(uploadPath,yearPath,monthPath,datePath);
	 return datePath;
 }
  private static void makeDir(String BasicPath, String...paths){
	  if(new File(paths[paths.length-1]).exists())
		  return ;
	  for(String path: paths){
		  File dirPath=new File(BasicPath+path);
		  if(! dirPath.exists()){
			  dirPath.mkdir();
		  }
	  }
  }
  public static String getThumbnailSeparator(){
	  return "-tn-";
  }
  
  private static String makeThumbnail(String uploadPath,String path, String fileName)throws Exception{
	  BufferedImage sourceImg=ImageIO.read(new File(uploadPath+path,fileName));
	  BufferedImage destImg=Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
	  String thumnailName=uploadPath+path+File.separator+getThumbnailSeparator()+fileName;
	  File newFIle=new File(thumnailName);
	  String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
	  
	  ImageIO.write(destImg, formatName.toUpperCase(), newFIle);
	  return newFIle.getAbsolutePath();
  }
  
   public static boolean deleteFile(String uploadPath,String originalName){
	   File file=new File(uploadPath,originalName);
	   return file.delete();
   }
  
   public static List<String> uploadFile(String uploadPath,String originalName,byte[] fileData)throws Exception{
	   UUID uid=UUID.randomUUID();
	   String saveName=uid.toString()+"_"+originalName;
	   String savePath=calPath(uploadPath);
	   File target= new File(uploadPath+savePath,saveName);
	   /*FileOutputStream fo= new FileOutputStream(target);
	   OutputStreamWriter ow= new OutputStreamWriter(fo,"utf-8");
	   */
	   FileCopyUtils.copy(fileData, target);
	   String formatName= originalName.substring(originalName.lastIndexOf(".")+1);
	   String uploadName=null;
	   if(MediaUtils.get(formatName)!=null){
		   uploadName= makeThumbnail(uploadPath,savePath,saveName);
	   }
	   List<String> ret = new ArrayList<>();
	   ret.add(target.getAbsolutePath()); //path
	   ret.add(uploadName);//uuidFileName
	   
	  
	   return ret;
   }
   
   //
   public static List<String> uploadFile(String uploadPath,String originalName,String fileData)throws Exception{
	   UUID uid=UUID.randomUUID();
	   String saveName=uid.toString()+"_"+originalName;
	   String savePath=calPath(uploadPath);
	   File target= new File(uploadPath+savePath,saveName);
	   FileOutputStream fo= new FileOutputStream(target);
	   OutputStreamWriter ow= new OutputStreamWriter(fo,"utf-8");
	   FileCopyUtils.copy(fileData, ow);
	   String formatName= originalName.substring(originalName.lastIndexOf(".")+1);
	   String uploadName=null;
	   if(MediaUtils.get(formatName)!=null){
		   uploadName= makeThumbnail(uploadPath,savePath,saveName);
	   }
	   List<String> ret = new ArrayList<>();
	   ret.add(target.getAbsolutePath()); //path
	   ret.add(uploadName);//uuidFileName
	   
	  
	   return ret;
   }
 
   
 
}