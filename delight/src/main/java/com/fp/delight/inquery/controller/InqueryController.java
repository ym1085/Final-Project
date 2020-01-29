package com.fp.delight.inquery.controller;

import java.util.ArrayList;
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

import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
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
		String userid=(String)session.getAttribute("userid");
		InqueryVO vo=new InqueryVO();
		vo.setInquerySeq(inquerySeq);
		vo.setUserid(userid);
		logger.info("vo.getInquerySeq()={}",vo.getInquerySeq());

		Map<String, Object> map=inqueryService.selectInqDetail(vo);
		logger.info("map={}",map);
		return map;
	}
	
	@RequestMapping("/member/myinqueryList.do")
	public void myinqueryList(@ModelAttribute InqueryVO inqueryVo,HttpSession session,Model model) {
		String userid=(String)session.getAttribute("userid");
		inqueryVo.setUserid(userid);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(inqueryVo.getCurrentPage());
		
		inqueryVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		inqueryVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<InqueryVO> list=inqueryService.selectInqueryList(inqueryVo);
		
		int totalRecord=inqueryService.selectTotalRecord(userid);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
		
	}
}
