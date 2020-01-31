package com.fp.delight.reservation.controller;

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

import com.fp.delight.common.DateSearchVO;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.reservation.model.ReservationService;

@Controller
public class ConfirmReservationController {
	private static final Logger logger
	=LoggerFactory.getLogger(ConfirmReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("/member/imp/mysec.do")
	public void mysec(HttpSession session,Model model) {
		String userid=(String)session.getAttribute("userid");
		logger.info("@@userid={}",userid);
		List<Map<String, Object>> list=reservationService.selectReserNew5(userid);
		
		model.addAttribute("list",list);
		logger.info("@@@@@list.size()={}",list.size());
	}
	
	@RequestMapping("/member/mysecList.do")
	public void mysecList(@ModelAttribute DateSearchVO dateSearchVo,
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
		
		List<Map<String, Object>> list=reservationService.selectReserList(dateSearchVo);
		
		int totalRecord=reservationService.TotalRecord(dateSearchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
	}
	
}
