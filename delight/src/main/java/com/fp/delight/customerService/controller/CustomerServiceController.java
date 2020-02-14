package com.fp.delight.customerService.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.ann.model.AnnService;
import com.fp.delight.ann.model.AnnVO;
import com.fp.delight.ann.model.FAQService;
import com.fp.delight.ann.model.FAQVO;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.customerService.model.CustomerServiceService;


@Controller
@RequestMapping("/customerService")
public class CustomerServiceController {
	private static final Logger logger=LoggerFactory.getLogger(CustomerServiceController.class);

	@Autowired 
	private AnnService annService;
	
	@Autowired
	private FAQService faqService;
	
	@Autowired
	private CustomerServiceService customerServiceService;
	 
	@RequestMapping("/customerServiceList.do")
	public String customerServiceList(@RequestParam(defaultValue="1") String annType, @ModelAttribute AnnVO annVo, Model model) {
		
		
		logger.info("고객센터 파라미터 noticeType={}",annType);		

		model.addAttribute("annType",annType);
		
		//일반 공지
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT+5);
		pagingInfo.setCurrentPage(annVo.getCurrentPage());
		
		annVo.setRecordCountPerPage(Utility.RECORD_COUNT+5);
		annVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		int normalExposureTotal=customerServiceService.normalExposureTotal(annVo);
		pagingInfo.setTotalRecord(normalExposureTotal);
		logger.info("노출된 일반공지 total={}",normalExposureTotal);
		logger.info("일반 공지 세팅 annVo={}",annVo);
		
		
		logger.info("==============일반 검색 검색어 검색 결과==========");
		List<AnnVO> list=customerServiceService.normalExposureSearch(annVo);
		logger.info("노출된 일반공지 List={}", list);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//공지 상단고정
		
		List<AnnVO> topList=customerServiceService.selectAnnTop();
		model.addAttribute("topList", topList);
		
		//이벤트 공지
		PaginationInfo pagingInfo2=new PaginationInfo();
		
		pagingInfo2.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo2.setRecordCountPerPage(Utility.RECORD_COUNT+5);
		pagingInfo2.setCurrentPage(annVo.getCurrentPage2());
		
		annVo.setRecordCountPerPage(Utility.RECORD_COUNT+5);
		annVo.setFirstRecordIndex2(pagingInfo2.getFirstRecordIndex());
		
		int eventExposureTotal=customerServiceService.eventExposureTotal(annVo);
		pagingInfo2.setTotalRecord(eventExposureTotal);
		logger.info("노출된 이벤트 공지 total={}" , eventExposureTotal);
		logger.info("노출된 이벤트 공지 세팅 annVo={}",annVo);
		
		logger.info("==============이벤트 검색 검색어 검색 결과==========");
		List<AnnVO> list2=customerServiceService.eventExposureSearch(annVo);
		logger.info("노출된 이벤트공지 List={}", list);
		logger.info("일반 공지 list.size()={}, 이벤트 공지 list2.size()={}",list.size(),list2.size());
		model.addAttribute("list2", list2);
		model.addAttribute("pagingInfo2", pagingInfo2);
				
		
		return "customerService/customerServiceList";
	}
	
	@RequestMapping("/customerServiceFAQ.do")
	public void customerServiceFAQ(@RequestParam(defaultValue="1") String faqType, @ModelAttribute FAQVO FAQVo, Model model) {
		logger.info("자주묻는질문 관리 페이지 파라미터 FAQVo={}",FAQVo);
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT+40);
		pagingInfo.setCurrentPage(FAQVo.getCurrentPage());
		
		FAQVo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT+40);
		FAQVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=faqService.faqtotal(FAQVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("자주묻는질문 total={}",totalRecord);
		logger.info("faq 세팅 FAQVo={}",FAQVo);
		
		List<FAQVO> list=faqService.faqSearch(FAQVo);
		model.addAttribute("faqType",faqType);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	@RequestMapping("/customerServiceDetail.do")
	public String customerServiceDetail(@RequestParam int annSeq, @ModelAttribute AnnVO annVo, Model model) {
		logger.info("공지글 상세보기 파라미터 annSeq={}",annSeq);
		AnnVO vo=annService.selAnnBySeq(annSeq);
		logger.info("공지글 검색 결과 vo={}",vo);
		model.addAttribute("vo", vo);
		
		return "customerService/customerServiceDetail";
	}
}
