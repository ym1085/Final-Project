package com.fp.delight.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.delight.ann.model.AnnListVO;
import com.fp.delight.ann.model.AnnService;
import com.fp.delight.ann.model.AnnVO;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;

@Controller
@RequestMapping("/admin/announcement")
public class AnnController {
	private static final Logger logger=LoggerFactory.getLogger(AnnController.class);
	
	@Autowired
	private AnnService annService;
	
	@RequestMapping(value = "/annWrite.do",method = RequestMethod.GET)
	public void annWrite_get() {
		logger.info("공지 작성 화면 보이기");
	}
	
	@RequestMapping(value = "/annSetting.do", method = RequestMethod.GET)
	public void annSetting_get() {
		logger.info("공지 설정 화면 보이기");
	}
	
	@RequestMapping(value = "/annWrite.do",method = RequestMethod.POST)
	public String annWrite_post(@ModelAttribute AnnVO annVo,Model model) {
		annVo.setUserid("admin");
		logger.info("공지글 등록 시작 파라미터 annVo={}",annVo);
		int cnt=annService.annInsert(annVo);
		
		String msg="", url="/admin/announcement/annWrite.do";
		if(cnt>0) {
			msg="공지글 등록완료";
		}else {
			msg="공지글 등록중 오류 발생";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	//
	@RequestMapping("/annInc.do")
	public String adminAnnSel(@ModelAttribute AnnVO annVo,Model model) {
		logger.info("공지 설정화면 파라미터 annVo={}",annVo);
		//일반 공지
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(annVo.getCurrentPage());
		logger.info("111111");
		annVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		annVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("2222222222");
		int normalTotal=annService.normalTotal(annVo);
		pagingInfo.setTotalRecord(normalTotal);
		logger.info("일반공지 total={}",normalTotal);
		logger.info("일반 공지 세팅 annVo={}",annVo);
		List<AnnVO> list=annService.annList(annVo);
		logger.info("444444444444");
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//이벤트 공지
		PaginationInfo pagingInfo2=new PaginationInfo();
		pagingInfo2.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo2.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo2.setCurrentPage(annVo.getCurrentPage2());
		
		annVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		annVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int eventTotal=annService.eventTotal(annVo);
		
		pagingInfo2.setTotalRecord(eventTotal);
		logger.info("이벤트 공지 total={}",eventTotal);
		logger.info("이벤트 공지 세팅 annVo={}",annVo);
		
		List<AnnVO> list2=annService.eventSearch(annVo);
		
		model.addAttribute("list2", list2);
		model.addAttribute("pagingInfo2", pagingInfo2);
		
		return "admin/announcement/annInc";
		
	}
	
	@RequestMapping("/normultiex.do")
	public String normultiex(@ModelAttribute AnnListVO annListVo,Model model) {
		logger.info("일반 공지 멀티 노출 설정 파라미터 annListVo={}",annListVo);
		List<AnnVO> list=annListVo.getAnnList();
		
		int cnt=annService.annMultiExpo(list);
		
		String msg="노출 설정 중 오류 발생", url="/admin/announcement/annInc.do";
		if(cnt>0) {
			msg="선택한 공지 글을 노출 설정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
