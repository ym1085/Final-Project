package com.fp.delight.review.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.common.DateSearchVO;
import com.fp.delight.common.FileUploadUtil;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.performent.controller.PerformentAPI;
import com.fp.delight.reservation.model.ReservationService;
import com.fp.delight.reservation.model.ReservationVO;
import com.fp.delight.review.model.ReviewService;
import com.fp.delight.review.model.ReviewVO;
import com.google.api.client.http.HttpRequest;

@Controller
@RequestMapping("/member")
public class ReviewController {
	private static final Logger logger
	=LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping("/myWriteReviewList.do")
	public void myWriteReviewList(@ModelAttribute DateSearchVO dateSearchVo,
			HttpSession session,Model model) {
		String userid=(String)session.getAttribute("userid");
		dateSearchVo.setCustomerId(userid);
		
		String startDay=dateSearchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str=sdf.format(today);
			
			dateSearchVo.setStartDay(str);
			dateSearchVo.setEndDay(str);			
		}
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
		
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		dateSearchVo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
		
		List<Map<String, Object>> list=reviewService.selectReviewList(dateSearchVo);
		
		int totalRecord=reviewService.TotalRecord(dateSearchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
	}
	
	@RequestMapping(value = "/NmReview.do",method = RequestMethod.GET)
	public void NmReview_get(@RequestParam(defaultValue = "0")int reservationSeq,Model model) {
		ReservationVO vo=reviewService.reservationDetail(reservationSeq);
		PerformentAPI perfom=new PerformentAPI();
		Map<String, Object> map=perfom.performDetail(vo.getMt20id());
		
		model.addAttribute("vo",vo);
		model.addAttribute("poster",map.get("poster"));
	}
	
	
	  @RequestMapping(value = "/NmReview.do",method = RequestMethod.POST) 
	  public String NmReview_post(@ModelAttribute ReviewVO reviewVo,HttpSession session,
			  Model model) {
		  String userid=(String)session.getAttribute("userid");
		  reviewVo.setUserid(userid);
		  int cnt=reviewService.insertReview(reviewVo);
		  String url="",msg="";
		  if(cnt>0) {
			  if(Integer.parseInt(reviewVo.getReviewType())==ReviewService.NM_REVIEW_TYPE) {
				  msg="일반후기가 등록되었습니다!";
				  url="/member/myPage.do";
			  }
		  }else {
			  url="/member/NmReview.do?reservationSeq="+reviewVo.getReservationSeq();
			  msg="후기등록실패!";
		  }
		  
		  model.addAttribute("url",url);
		  model.addAttribute("msg",msg);
		  
		  return "common/message";
	  }
	
	@RequestMapping(value = "/PhotoReview.do",method = RequestMethod.GET)
	public void PhotoReview_get(@RequestParam(defaultValue = "0")int reservationSeq,Model model) {
		ReservationVO vo=reviewService.reservationDetail(reservationSeq);
		PerformentAPI perfom=new PerformentAPI();
		Map<String, Object> map=perfom.performDetail(vo.getMt20id());
		
		model.addAttribute("vo",vo);
		model.addAttribute("poster",map.get("poster"));
	}
	
	  @RequestMapping(value = "/PhotoReview.do",method = RequestMethod.POST)
	  public String PhotoReview_post(@ModelAttribute ReviewVO reviewVo,HttpServletRequest request,
			  HttpSession session,Model model) {
		  String userid=(String)session.getAttribute("userid");
		  reviewVo.setUserid(userid);
		  
		  List<String> list=
				  fileUtil.fileUpload(request, FileUploadUtil.REVIEW_UPLOAD, userid);
		  logger.info("list.size={}",list.size());
		  
		  if(list.size()==1) {
			  reviewVo.setReviewP1(userid+"/"+list.get(0));
		  }else if(list.size()==2) {
			  reviewVo.setReviewP1(userid+"/"+list.get(0));
			  reviewVo.setReviewP2(userid+"/"+list.get(1));
		  }else if(list.size()==3) {
			  reviewVo.setReviewP1(userid+"/"+list.get(0));
			  reviewVo.setReviewP2(userid+"/"+list.get(1));
			  reviewVo.setReviewP3(userid+"/"+list.get(2));
		  }
		  
		  int cnt=reviewService.insertReview(reviewVo);
		  
		  String url="",msg="";
		  if(cnt>0) {
			  if(Integer.parseInt(reviewVo.getReviewType())==ReviewService.PH_REVIEW_TYPE) {
				  msg="포토후기가 등록되었습니다!";
				  url="/member/myPage.do";
			  }
		  }else {
			  url="/member/NmReview.do?reservationSeq="+reviewVo.getReservationSeq();
			  msg="후기등록실패!";
		  }
		  
		  model.addAttribute("url",url);
		  model.addAttribute("msg",msg);
		  
		  return "common/message";
	  } 

		@RequestMapping("/imp/myreview.do")
		public void myreview(HttpSession session,Model model) {
			String userid=(String)session.getAttribute("userid");
			List<Map<String, Object>> list=reviewService.selectReviewNew5(userid);
			model.addAttribute("list",list);
		}
		
		@RequestMapping("/myreviewList.do")
		public void myreviewList(@ModelAttribute DateSearchVO dateSearchVo,HttpSession session,
				Model model) {
			String userid=(String)session.getAttribute("userid");
			dateSearchVo.setCustomerId(userid);
			
			String startDay=dateSearchVo.getStartDay();
			if(startDay==null || startDay.isEmpty()) {
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String str=sdf.format(today);
				
				dateSearchVo.setStartDay(str);
				dateSearchVo.setEndDay(str);			
			}
			
			logger.info("@@파라미터확인userid={}",userid);
			logger.info("@@파라미터확인dateSearchVo={}",dateSearchVo);
			
			PaginationInfo pagingInfo=new PaginationInfo();
			pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
			pagingInfo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
			pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
			
			dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			dateSearchVo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
			
			List<Map<String, Object>> list=reviewService.ReviewWriteList(dateSearchVo);
			
			int totalRecord=reviewService.ReviewWriteTotalRecord(dateSearchVo);
			pagingInfo.setTotalRecord(totalRecord);
			
			model.addAttribute("list",list);
			model.addAttribute("pagingInfo",pagingInfo);
		}
		
		@RequestMapping("/reviewDetail.do")
		@ResponseBody
		public Object reviewDetail(@RequestParam int reviewSeq,
				HttpSession session) {
			logger.info("ajax 처리 시작");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
			String userid=(String)session.getAttribute("userid");
			ReviewVO reviewVo=new ReviewVO();
			reviewVo.setReviewSeq(reviewSeq);
			reviewVo.setUserid(userid);
			
			Map<String, Object> map=reviewService.reviewDetail(reviewVo);
			String perfomid=(String)map.get("REVIEW_MT20ID");
			PerformentAPI perfom=new PerformentAPI();
			map.putAll(perfom.performDetail(perfomid));
			
			map.put("REVIEW_REGDATE", sdf.format(map.get("REVIEW_REGDATE")));
			
			String content=(String)map.get("REVIEW_CONTENT");
			map.put("REVIEW_CONTENT",content.replace("\r\n", "<br>"));
			
			logger.info("확인@@#@#@#@ map={}",map);
			return map;
		}
}
