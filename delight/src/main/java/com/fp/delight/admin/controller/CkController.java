package com.fp.delight.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fp.delight.common.Utility;
import com.google.gson.JsonObject;

@Controller
public class CkController {
	private static final Logger logger=LoggerFactory.getLogger(CkController.class);
	
	@RequestMapping(value="/adm/fileupload.do", method=RequestMethod.POST)
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, HttpSession session,
                 MultipartHttpServletRequest multiFile) throws IOException {
		logger.info("시작");
		
		resp.setContentType("text/html;charset=utf-8");
        resp.setCharacterEncoding("utf-8");
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null){
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						String fileOrginalName=file.getOriginalFilename();
						byte[] bytes = file.getBytes();
						String upPath = req.getSession().getServletContext().getRealPath("img");
						//String upPath = "D:/lecture/delight/delight2/delight/src/main/webapp/resources/img";
						
						fileName = getUniqueFileName(fileOrginalName);
						
						//int idx=fileName.lastIndexOf(".");
						//String fNamefolder=fileName.substring(0, idx);
						//upPath = upPath + "/"+fNamefolder;
						
						File uploadFile = new File(upPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						//이미지 파일
						String upPath1 = upPath + "/"+ fileName;
						out = new FileOutputStream(new File(upPath1));
                        out.write(bytes);
                        //8비트 배열 파일
                        //fileName = UUID.randomUUID().toString();
						//upPath = upPath + "/" +fileName;
						//out = new FileOutputStream(new File(upPath));
                        //out.write(bytes);

                        
                        System.out.println("fileName="+fileName);
                        printWriter = resp.getWriter();
                        
                        //String fName=new String(fileName.getBytes("euc-kr"),"8859_1");
                        System.out.println("fName="+fileName);
                        //String fileUrl = req.getContextPath() + "/img/"+fNamefolder +"/"+ fileName;
                        String fileUrl = req.getContextPath() + "/img/"+fileName;
                        System.out.println(fileUrl);
                        //<c:url value='/resources/ima/ddd.jpg'/>
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
                        json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        String userid=(String) session.getAttribute("adminUserid");
                        Utility.urltag.put(userid, upPath1);
                        System.out.println("fileUrl="+upPath1);
                        System.out.println(json);
                        printWriter.println(json);
                        
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}	
	
	public String getUniqueFileName(String originFileName) {
		//파일명에 현재시간(년월일시분초밀리초)을 붙여서 파일명 변경
		//abc.txt => abc20191224120350123.txt
		int idx=originFileName.lastIndexOf(".");
		String fName=originFileName.substring(0, idx); //abc
		String ext = originFileName.substring(idx); //.txt
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String time=sdf.format(d);
		
		String fileName=fName+time+ext;
		
		
		return fileName;
	}
}
