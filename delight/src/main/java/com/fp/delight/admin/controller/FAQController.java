package com.fp.delight.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.ann.model.FAQService;
import com.fp.delight.ann.model.FAQVO;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;

@Controller
@RequestMapping("/admin/FAQ")
public class FAQController {
	private static final Logger logger=LoggerFactory.getLogger(FAQController.class);
	
	@Autowired
	private FAQService faqService;
	
	@RequestMapping("/FAQManagement.do")
	public void FAQManagement(@ModelAttribute FAQVO FAQVo, Model model) {
		logger.info("자주묻는질문 관리 페이지 파라미터 FAQVo={}",FAQVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		pagingInfo.setCurrentPage(FAQVo.getCurrentPage());
		
		FAQVo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		FAQVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=faqService.faqtotal(FAQVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("자주묻는질문 total={}",totalRecord);
		logger.info("faq 세팅 FAQVo={}",FAQVo);
		
		List<FAQVO> list=faqService.faqSearch(FAQVo);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
	}
	
	@RequestMapping(value = "/FAQWrite.do", method = RequestMethod.GET)
	public void FAQWrite() {
		logger.info("자주묻는 질문 작성 페이지");
		
	}
	
	@RequestMapping(value = "/FAQWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public int FAQWrite(@ModelAttribute FAQVO FAQVo,HttpSession session) {
		logger.info("자주묻는 질문 작성 페이지");
		
		if(FAQVo.getSearchKeyword()==null) {
			FAQVo.setSearchKeyword("");
		}
		
		String userid=(String) session.getAttribute("adminUserid");
		/*FAQVo.setFaqContent(faqContent);
		FAQVo.setFaqTitle(faqTitle);
		FAQVo.setFaqType(faqType);*/
		FAQVo.setUserid(userid);
		logger.info("파라미터 세팅 후 FAQVo={}",FAQVo);
		int res=faqService.FAQwrite(FAQVo);
		
		return res;
	}
	
	@RequestMapping("/faqDel.do")
	@ResponseBody
	public int faqDel(@RequestParam int faqSeq) {
		logger.info("faq 삭제 파라미터 faqSeq={}",faqSeq);
		
		int res=faqService.faqdel(faqSeq);
		
		return res;
	}
	
}
