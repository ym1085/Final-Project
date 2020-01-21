package com.fp.delight.ticket.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.ticket.model.TicketService;
import com.fp.delight.ticket.model.TicketVO;

@Controller
public class TicketController {
	private static final Logger logger
		=LoggerFactory.getLogger(TicketController.class);
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping("/ticketCategory.do")
	@ResponseBody
	public TicketVO ticketCategory(@RequestParam int ticketSeq){
		logger.info("ajax 파라미터 확인 ticketSeq={}",ticketSeq);
		TicketVO vo=ticketService.selectCategory(ticketSeq);
		logger.info("ajax vo 파라미터 vo={}",vo);
		return vo;
	}
}
