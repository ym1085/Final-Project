package com.fp.delight.index.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fp.delight.api.ApiTest_Index;
import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.performent.model.PerformentListVO;


@Controller
public class IndexController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/index.do")
	public String Index_get(Model model) {
		logger.info("Index 화면 보여주기");
    	
    	try {
    		ApiTest_Index apiTest = new ApiTest_Index();
    		List<PerformentListVO> alist = apiTest.receiveAPI(); 
			
			model.addAttribute("alist", alist);
    	} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
		return "index";
	}
}
