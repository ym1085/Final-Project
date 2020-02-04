package com.fp.delight.review.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

import com.fp.delight.common.DateSearchVO;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.performent.controller.PerformentAPI;
import com.fp.delight.reservation.model.ReservationService;
import com.fp.delight.reservation.model.ReservationVO;
import com.fp.delight.review.model.ReviewService;
import com.fp.delight.review.model.ReviewVO;

@Controller
@RequestMapping("/member")
public class ReviewController {
	private static final Logger logger
	=LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
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
	
	/*
	 * @RequestMapping(value = "/NmReview.do",method = RequestMethod.POST) public
	 * String NmReview_post(@ModelAttribute ReviewVO reviewVo,HttpSession session,
	 * Model model) {
	 * 
	 * }
	 */
}
