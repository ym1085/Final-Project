package com.fp.delight.admin.salesManagement.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/salesManagement")
public class SalesController {
	private static final Logger logger=LoggerFactory.getLogger(SalesController.class);
	
	@RequestMapping("/salesSetting.do")
	public void salesSetting() {
		logger.info("판매 표 수량 설정 페이지 보이기");
	}
	
	
}
