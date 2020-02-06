package com.fp.delight.category.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.delight.api.ApiTest_reservation;
import com.fp.delight.performent.model.PerformentListVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	private static final Logger logger
		=LoggerFactory.getLogger(ReservationController.class);
	
	@RequestMapping(value = "/doReservation.do")
	public String Index_get(Model model) {
		logger.info("Index 화면 보여주기");
    	
    	try {
    		ApiTest_reservation apiTest = new ApiTest_reservation();
    		List<PerformentListVO> alist = apiTest.receiveAPI(); 
			
			model.addAttribute("alist", alist);
    	} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
		return "reservation/doReservation";
	}
}
