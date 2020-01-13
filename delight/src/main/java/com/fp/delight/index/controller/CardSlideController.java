package com.fp.delight.index.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CardSlideController {
	private static final Logger logger
		=LoggerFactory.getLogger(CardSlideController.class);
	
	@RequestMapping(value = "/inc_CardSlide.jsp.do")
	public String CardSlide() {
		logger.info("inc_CardSlide.jsp 화면 보여주기");
		
		return "inc_CardSlide.jsp";
	}
	
	
}
