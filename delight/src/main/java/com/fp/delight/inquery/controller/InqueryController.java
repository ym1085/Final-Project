package com.fp.delight.inquery.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.inquery.model.InqueryService;
import com.fp.delight.inquery.model.InqueryVO;

@Controller
public class InqueryController {
	private static final Logger logger
	= LoggerFactory.getLogger(InqueryController.class);
	
	@Autowired
	private InqueryService inqueryService;
	
	@RequestMapping("/inqueryWrite.do")
	@ResponseBody
	public String inqeryWrite(@ModelAttribute InqueryVO inqueryVo,HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		
		String res="";
		
		if(userid==null || userid.isEmpty()) {
			inqueryVo.setUserid("");
			res="N";
		}else {
			inqueryVo.setUserid(userid);
			res="Y";
		}
		logger.info("매개변수 inquertVo={}",inqueryVo);
		inqueryService.Inquerywrite(inqueryVo);
		logger.info("res={}",res);
		return res;
	}
	
	@RequestMapping("/member/imp/myinquery.do")
	public void myinquery(HttpSession session,Model model) {
		
		  String userid=(String)session.getAttribute("userid"); List<InqueryVO>
		  list=inqueryService.selectNew3(userid);
		  
		  model.addAttribute("list",list);
		 
	}
	@RequestMapping("/inqueryDetail.do")
	@ResponseBody
	public Object inqdetail(@RequestParam(defaultValue = "0")int inquerySeq,HttpSession session) {
		//String userid=(String)session.getAttribute("userid");
		InqueryVO vo=new InqueryVO();
		vo.setInquerySeq(inquerySeq);
		//vo.setUserid(userid);
		

		Map<String, Object> map=inqueryService.selectInqDetail(vo);
		
		return map;
	}
}
