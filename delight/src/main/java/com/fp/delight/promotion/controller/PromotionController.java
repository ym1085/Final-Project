package com.fp.delight.promotion.controller;

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
				
		PromotionVO list = promotionService.myPromotionList(id);
		logger.info("글목록 결과, list", list);
		
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping(value="/PromotionReview.do", method=RequestMethod.GET)
	public String PromotionReview_get() {
		logger.info("홍보 글작성 화면 보여주기");
		
		return "member/PromotionReview";
	}
	
	
	 @RequestMapping(value="/PromotionReview.do", method = RequestMethod.POST)
	 public String PromotionReview_post(@ModelAttribute PromotionVO promotionVo,HttpServletRequest request,
			  HttpSession session,Model model) {
		  String userid=(String)session.getAttribute("userid");
		  promotionVo.setUserid(userid);
		  
		  List<String> list=
				  fileUtil.fileUpload(request, FileUploadUtil.REVIEW_UPLOAD, userid);
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
}
