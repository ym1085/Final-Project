package com.fp.delight.index.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;

@Controller
public class IndexController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/index.do")
	public void main2(HttpSession session,Model model) {
		logger.info("index 화면 보여주기");
		
		String userid=(String)session.getAttribute("userid");
		
		logger.info("userid={}",userid);
		
		if(userid!=null && !userid.isEmpty()) {
			MemberVO memberVo=memberService.selectMember(userid);
			logger.info("memberVo={}",memberVo);
			model.addAttribute("memberVo",memberVo);
		}
		
		
	}
	
}
