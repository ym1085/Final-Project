package com.fp.delight.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MyPageController {
	private static final Logger logger
	=LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping("/imp/mysec.do")
	public void mysec() {
		
	}
	
	@RequestMapping("/imp/mysecCan.do")
	public void mysecCan() {
		
	}
	@RequestMapping("/imp/mylike.do")
	public void mylike() {
		
	}
	@RequestMapping("/imp/myinquery.do")
	public void myinquery() {
		
	}
	@RequestMapping("/imp/myreview.do")
	public void myreview() {
		
	}
	@RequestMapping("/mysecList.do")
	public void mysecList() {
		
	}
	
	@RequestMapping("/mysecCanList.do")
	public void mysecCanList() {
		
	}
	@RequestMapping("/mylikeList.do")
	public void mylikeList() {
		
	}
	@RequestMapping("/myinqueryList.do")
	public void myinqueryList() {
		
	}
	@RequestMapping("/myreviewList.do")
	public void myreviewList() {
		
	}
	@RequestMapping("/mysnewPer.do")
	public void mysnewPer() {
		
	}
	@RequestMapping("/myWriteReview.do")
	public void myWriteReview() {
		
	}


}
