package com.fp.delight.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {
	private static final Logger logger
		=LoggerFactory.getLogger(FileUploadUtil.class);
	
	public static final int REVIEW_UPLOAD=1;  //리뷰 사진 업로드
	public static final int PROMOTION_UPLOAD=2; //홍보 사진 업로드
	
	@Resource(name = "fileUpProperties")
	private Properties props;
	
	public List<String> fileUpload(HttpServletRequest request,
			int uploadPathType,String userid) {
		//파일 업로드 처리
		MultipartHttpServletRequest multiReq
			=(MultipartHttpServletRequest)request;
		
		List<MultipartFile> mlist=new ArrayList<MultipartFile>();
		
		if(multiReq.getFile("reviewPho1")!=null && !multiReq.getFile("reviewPho1").isEmpty()) {
			mlist.add(multiReq.getFile("reviewPho1"));
		}else if(multiReq.getFile("reviewPho2")!=null && !multiReq.getFile("reviewPho2").isEmpty()) {
			mlist.add(multiReq.getFile("reviewPho2"));
		}else if(multiReq.getFile("reviewPho3")!=null && !multiReq.getFile("reviewPho3").isEmpty()) {
			mlist.add(multiReq.getFile("reviewPho3"));
		}
		
		//결과를 넣을 List
		List<String> list
			=new ArrayList<String>();
		
		for(int i=0; i<mlist.size();i++) {
			MultipartFile tempFile=mlist.get(i);
			System.out.println(mlist.get(i));
			//업로드된 경우
			if(!tempFile.isEmpty()) {
				//변경된 파일명
				String fileName=tempFile.getOriginalFilename();
				fileName=getUniqueFileName(fileName);
				list.add(fileName);
				
				//업로드 처리
				//업로드할 경로 구하기
				String upPath=getFilePath(request, uploadPathType);
				upPath=upPath+"/"+userid;
				File folder=new File(upPath);
				
				if(!folder.exists()) {
					folder.mkdir();
				}
				
				File file=new File(upPath, fileName);
				
				try {
					tempFile.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}			
				
			}
		}//for
		
		return list;
	}

	public String getFilePath(HttpServletRequest request, int uploadPathType) {
		//업로드할 경로 구하기
		String path="";
		
		String type=props.getProperty("file.upload.type");
		logger.info("type={}", type);
		
		if(type.equals("test")) {  //테스트 경로
			if(uploadPathType==REVIEW_UPLOAD) {
				path=props.getProperty("review.upload.path.test");
			}else if(uploadPathType==PROMOTION_UPLOAD) {
				path=props.getProperty("promotion.upload.path.test");
			}
		}else { //배포시 실제 경로
			String upDir="";
			if(uploadPathType==REVIEW_UPLOAD) {			
				upDir=props.getProperty("review.upload.path");
			}else if(uploadPathType==PROMOTION_UPLOAD) {
				upDir=props.getProperty("promotion.upload.path");
			}
			
			path
			=request.getSession().getServletContext().getRealPath(upDir);
			
			//config.getServletContext().getRealPath(upDir);
		}
		logger.info("업로드 경로  path={}", path);
		
		return path;
	}

	private String getUniqueFileName(String originFileName) {
		//파일명에 현재시간(년월일시분초밀리초)을 붙여서 파일명 변경
		//abc.txt => abc20191224120350123.txt
		int idx=originFileName.lastIndexOf(".");
		String fName=originFileName.substring(0, idx); //abc
		String ext = originFileName.substring(idx); //.txt
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String time=sdf.format(d);
		
		String fileName=fName+time+ext;
		logger.info("변경된 fileName={}", fileName);
		
		return fileName;
	}
	
	
}
