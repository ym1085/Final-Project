package com.fp.delight.promotion.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fp.delight.common.FileUploadUtil;
import com.fp.delight.promotion.model.PromotionService;
import com.fp.delight.promotion.model.PromotionVO;

@Controller
@RequestMapping("/member")
public class PromotionController {
	private static final Logger logger
	=LoggerFactory.getLogger(PromotionController.class);
	
	@Autowired
	private PromotionService promotionService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping("/imp/myPromotion.do")
	public void myPromotionList(HttpSession session, Model model) {
		String id = (String)session.getAttribute("userid");
		
		logger.info("파라미터 확인 userid={}", id);
				
		PromotionVO vo = promotionService.myPromotionList(id);
		logger.info("홍보 글 목록 결과, vo", vo);
		
		model.addAttribute("vo", vo);
		
	}
	
	@RequestMapping(value="/PromotionReview.do", method=RequestMethod.GET)
	public String PromotionReview_get() {
		logger.info("홍보 글작성 화면 보여주기");
		
		return "member/PromotionReview";
	}
	
	
	 @RequestMapping(value="/PromotionReview.do", method = RequestMethod.POST)
	 public String PromotionReview_post(@ModelAttribute PromotionVO promotionVo,
			 HttpServletRequest request,
			  HttpSession session,Model model) {
		 String userid=(String)session.getAttribute("userid");
		  promotionVo.setUserid(userid);
		  
		  logger.info("promotionVo 나와라={}", promotionVo);
		  
		  List<String> list=
				  fileUtil.fileUpload(request, FileUploadUtil.PROMOTION_UPLOAD, userid);
		  logger.info("list.size={}",list.size());
		  
		  if(list.size()==1) {
			  promotionVo.setPromoteP1(userid+"/"+list.get(0));
		  }
		  
		  int cnt=promotionService.insertPromotion(promotionVo);
		  
		  String url="",msg="";
		  if(cnt>0) {	  
				  msg="홍보 게시물이 등록되었습니다!";
				  url="/member/myPage.do";
		  }else {
			  url="/member/PromotionReview.do";
			  msg="홍보 게시물 등록실패!";
		  }
		  
		  model.addAttribute("url",url);
		  model.addAttribute("msg",msg);
		  
		  return "common/message";
	  } 
	 
	 
	 @RequestMapping(value="/PromotionDetail.do" , method = RequestMethod.GET)
	 public String PromotionDetail_get(HttpSession session, 
			 @RequestParam(defaultValue = "0") int promoteSeq, Model model) {
		 String id = (String)session.getAttribute("userid");
		 logger.info("상세보기 파라미터 확인 userid={}", id);
		 
		 logger.info("홍보 리스트 상세보기 파라미터, promoteSeq={}", promoteSeq);
		 
		 
		 if(promoteSeq==0) {
			 model.addAttribute("msg", "잘못된 url입니다.");
			 model.addAttribute("url", "/member/myPage.do");
			 
			 return "common/message";
		 }
		 
		 PromotionVO promotionVo = promotionService.selectByPromoteSeq(promoteSeq);
		 logger.info("상세보기 결과, vo={}", promotionVo);
		 
		 model.addAttribute("vo", promotionVo);
		 
		 return "member/PromotionDetail";
	 }
	 
	 
	 @RequestMapping(value="/PromotionEdit.do", method=RequestMethod.GET)
		public String PromotionEdit_get(HttpSession session, 
				@RequestParam(defaultValue = "0") int promoteSeq, Model model) {
		 
		 logger.info("홍보 글 수정 화면 보여주기");
			
		 String id = (String)session.getAttribute("userid");
		 logger.info("수정하기 파라미터 확인 userid={}", id);
			 
		 logger.info("홍보 게시물 수정하기 파라미터, promoteSeq={}", promoteSeq);
			 
		 if(promoteSeq==0) {
			 model.addAttribute("msg", "잘못된 url입니다.");
			 model.addAttribute("url", "/member/PromotionDetail.do");
				 
			 return "common/message";
		}
			 
		PromotionVO promotionVo = promotionService.selectByPromoteSeq(promoteSeq);
		logger.info("수정하기 결과, vo={}", promotionVo);
			 
		model.addAttribute("vo", promotionVo);
			
		return "member/PromotionEdit";
		
		}
	 
	 
	 @RequestMapping(value="/PromotionEdit.do", method = RequestMethod.POST)
	 public String PromotionEdit_post(@ModelAttribute PromotionVO promotionVo,
			 HttpServletRequest request, HttpSession session, Model model) {
		 
		String userid=(String)session.getAttribute("userid");
		promotionVo.setUserid(userid);
		  
		logger.info("홍보 글 수정처리 promotionVo={}", promotionVo);
		
		//파일 업로드 처리
		MultipartHttpServletRequest multiReq = (MultipartHttpServletRequest)request;
		
		List<MultipartFile> mlist=new ArrayList<MultipartFile>();
		
		//업로드된 파일이 있는 경우
		if(multiReq.getFile("fileName")!=null && !multiReq.getFile("fileName").isEmpty()) {
			
			PromotionVO oldVo=promotionService.selectByPromoteSeq(promotionVo.getPromoteSeq());
			String oldPath=oldVo.getPromoteP1();  
			logger.info("기존에 있던 사진, oldPath={}",oldPath);	
			
			//파일경로 찾는다
			String path = fileUtil.getFilePath(request, FileUploadUtil.PROMOTION_UPLOAD);		  
			logger.info("path={}",path);
			
			//파일삭제
			File file = new File(path+"/"+oldPath);
				if(file.exists()) {
					boolean bool=file.delete();
					logger.info("홍보 이미지 삭제 여부 : {}", bool); //삭제된거 찍힘
				}
				
			mlist.add(multiReq.getFile("fileName"));
			
			//파일 새로 업로드 시킨다
			List<String> list = fileUtil.fileUpload(request, FileUploadUtil.PROMOTION_UPLOAD, userid);
			logger.info("list.size={}",list.size());
	
			promotionVo.setPromoteP1(userid+"/"+list.get(0));
			
		} else {
			PromotionVO oldVo=promotionService.selectByPromoteSeq(promotionVo.getPromoteSeq());
			String oldPath=oldVo.getPromoteP1();  //아이디/파일명 (path)/promotionuplod/oldpath
			logger.info("기존에 있던 사진, oldPath={}",oldPath);	
			
			promotionVo.setPromoteP1("/"+oldPath);
		}
		
		//업데이트 해준다
		int cnt=promotionService.updatePromotion(promotionVo);
		

		  String url="",msg="";
		  if(cnt>0) {	  
			  msg="수정 완료 되었습니다.";
			  url="/member/myPage.do";
		  }else {
			  url="/member/PromotionDetail.do";
			  msg="수정 실패!";
		  }
		  
		  model.addAttribute("url",url);
		  model.addAttribute("msg",msg);
		  
		  return "common/message";
	  } 
	 
	 
	 @RequestMapping("/PromotionDelete.do")
		public String delete_post(@RequestParam(defaultValue = "0") int promoteSeq, 
				@ModelAttribute PromotionVO promotionVo, 
				HttpServletRequest request, Model model) {
		 
			//1
			logger.info("글 삭제 처리, 파라미터 promoteSeq={}", promoteSeq);
			
			logger.info("홍보 글 수정처리 promotionVo={}", promotionVo);
			
			if(promoteSeq!=0) {
				PromotionVO oldVo=promotionService.selectByPromoteSeq(promotionVo.getPromoteSeq());
				String oldPath=oldVo.getPromoteP1();  
				logger.info("기존에 있던 사진, oldPath={}",oldPath);	
				
				String path = fileUtil.getFilePath(request, FileUploadUtil.PROMOTION_UPLOAD);		  
				logger.info("path={}",path);
				
				File file = new File(path+"/"+oldPath);
				logger.info("file={}",file);
				if(file.exists()) {
					boolean bool=file.delete();
					logger.info("홍보 이미지 삭제 여부 : {}", bool); //삭제된거 찍힘
				}
				
			}
						
			//2
			String msg="", url="/member/PromotionDelete.do?promoteSeq="+promoteSeq;
			int cnt=promotionService.deletePromotion(promoteSeq);
			
				if(cnt>0) {	
					msg="홍보 글 삭제되었습니다.";
					url="/member/myPage.do";
				}else {
					msg="홍보 글 삭제 실패!";
					url="/member/PromotionDetail.do";
				}
			
			//3
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "common/message";
		}
	 
}
