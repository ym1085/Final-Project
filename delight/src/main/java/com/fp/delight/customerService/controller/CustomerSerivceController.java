package com.fp.delight.customerService.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/customerService")
public class CustomerSerivceController {
	private static final Logger logger=LoggerFactory.getLogger(CustomerSerivceController.class);
	
	@RequestMapping(value="/customerServiceBoard.do", method=RequestMethod.GET)  
	public void CustomerServiceBoard_get() {
		logger.info("고객센터 게시판 보여주기");
		
	}
}
