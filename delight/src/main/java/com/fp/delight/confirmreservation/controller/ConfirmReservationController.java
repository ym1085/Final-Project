package com.fp.delight.confirmreservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConfirmReservationController {
	private static final Logger logger 
		= LoggerFactory.getLogger(ConfirmReservationController.class);
	
	//[1] 사이드바 예약 카테고리 클릭 시 이동
	@RequestMapping("/reservation/confirmReservation.do")
	public String showConfrimReservation() {
		logger.info("예약 확인/취소 페이지 보여주기");
	
		return "reservation/confirmReservation";
	}
}
