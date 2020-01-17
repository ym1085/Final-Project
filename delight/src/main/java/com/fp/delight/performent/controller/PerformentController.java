package com.fp.delight.performent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/performance")
public class PerformentController {
	private final Logger logger
		= LoggerFactory.getLogger(PerformentController.class);

	@RequestMapping("/pfdetail.do")
	public String performentList() {
		logger.info("공연 API, 공연목록 데이터 출력!");
	
		return "performance/pfDetail";
	}
}
