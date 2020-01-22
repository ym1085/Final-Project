package com.fp.delight.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/imp")
public class MyPageController {
	private static final Logger logger
	=LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping("/mysec.do")
	public void mysec() {
		
	}
	
	@RequestMapping("/mysecCan.do")
	public void mysecCan() {
		
	}
	@RequestMapping("/mylike.do")
	public void mylike() {
		
	}
	@RequestMapping("/myinquery.do")
	public void myinquery() {
		
	}
	@RequestMapping("/myreview.do")
	public void myreview() {
		
	}
	@RequestMapping("/myinqueryTab.do")
	public void myinqueryTab() {
		
	}
	@RequestMapping("/test123.do")
	public void test123() {
		
	}
}
