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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.common.DateSearchVO;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.performent.controller.PerformentAPI;
import com.fp.delight.refund.model.RefundService;
import com.fp.delight.refund.model.RefundVO;
import com.fp.delight.refundbec.model.RefundbecService;
import com.fp.delight.refundbec.model.RefundbecVO;
import com.fp.delight.reservation.model.ReservationService;
import com.fp.delight.reservation.model.ReservationVO;

@Controller
@RequestMapping("/member")
public class ConfirmReservationController {
	private static final Logger logger
	=LoggerFactory.getLogger(ConfirmReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private RefundbecService refundbecService;
	
	@Autowired
	private RefundService refundService;
	
	@RequestMapping("/imp/mysec.do")
	public void mysec(HttpSession session,Model model) {
		String userid=(String)session.getAttribute("userid");
		logger.info("@@userid={}",userid);
		List<Map<String, Object>> list=reservationService.selectReserNew5(userid);
		
		model.addAttribute("list",list);
		logger.info("@@@@@list.size()={}",list.size());
	}
	
	@RequestMapping("/mysecList.do")
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
	
	@RequestMapping("/imp/mysecCan.do")
	public void mysecCan(HttpSession session,Model model) {
		String userid=(String)session.getAttribute("userid");
		List<Map<String, Object>> list=reservationService.selectCanNew5(userid);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("/mysecCanList.do")
	public void mysecCanList(@ModelAttribute DateSearchVO dateSearchVo,
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
		
		dateSearchVo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list=reservationService.selectCanList(dateSearchVo);
		
		int totalRecord=reservationService.canTotalRecord(dateSearchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
	}
	
	@RequestMapping(value = "/myreserCancle.do",method = RequestMethod.GET)
	public void myreserCansle_get(@RequestParam(defaultValue = "0")int reservationSeq,
			HttpSession session,Model model) {
		String userid=(String)session.getAttribute("userid");
		ReservationVO reservationVo=new ReservationVO();
		reservationVo.setUserid(userid);
		reservationVo.setReservation_seq(reservationSeq);
		
		Map<String, Object> map=reservationService.selectCanDetail(reservationVo);
		
		List<RefundbecVO> refundlist=refundbecService.selectRefundbecAll();

		PerformentAPI perfom=new PerformentAPI();
		Map<String, Object> perfomap=perfom.performDetail((String)map.get("MT20ID"));
		
		model.addAttribute("map",map);
		model.addAttribute("refundlist",refundlist);
		model.addAttribute("poster",(String)perfomap.get("poster"));
	}
	
	@RequestMapping(value = "/myreserCancle.do",method =RequestMethod.POST )
	public String myreserCansle_post(@ModelAttribute RefundVO refundVo,
			@RequestParam(defaultValue = "0")int reservationSeq,Model model) {
		//@RequestParam(defaultValue = "0")int paySeq,
		//@RequestParam(defaultValue = "0")int refundbecSeq
		logger.info("@@@@@@refundVo={}",refundVo);
		logger.info("@@@@@@reservationSeq={}",reservationSeq);
		int cnt=refundService.insertRefund(refundVo);
		
		String msg="",url="";
		if(cnt>0) {
			msg="취소신청이 완료되었습니다!";
			url="/member/myPage.do";
		}else {
			msg="취소신청실패!";
			url="/member/myreserCancle.do?reservationSeq="+reservationSeq;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}
