package com.fp.delight.mileage.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mileage.model.MileageService;
import com.fp.delight.mileage.model.MileageVO;

@Controller
public class MileageController {
	private static final Logger logger
		= LoggerFactory.getLogger(MileageController.class);
	
	@Autowired
	private MileageService mileageService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member/imp/myMileageSub.do")
	public String earningHistory(HttpSession session, Model model) {
		logger.info("로그인 된 유저의 적립된 마일리지 보여주기");
		
		String userid = (String)session.getAttribute("userid");
		logger.info("로그인 된 유저의 적립 마일리지 확인, 파라미터 userid={} ", userid);
		
		int mileaebecSeq = 1;
		List<Map<String, Object>> list = null;
		if(userid!=null && !userid.isEmpty()) {
			MileageVO mileageVo = new MileageVO();
			mileageVo.setUserid(userid);
			mileageVo.setMileaebecSeq(mileaebecSeq);

			list = mileageService.myMileage(mileageVo);
			logger.info("로그인 된 유저의 적립 마일리지 List결과, list={} ", list.size());
			logger.info("디버깅 list={} ", list);
			
			model.addAttribute("list", list);
		}
		
		return "member/imp/myMileageSub";
	}
	
	@RequestMapping("/member/myMileageTitle1.do")	
	public String mileTitle1(HttpSession session, Model model,
			@RequestParam int mileaebecSeq ,@ModelAttribute MileageVO mileageVo) {
		logger.info("전체 클릭 시, 로그인 된 유저의 모든 마일리지 보여주기");
		
		logger.info("mileageVo={}", mileageVo);
		
		String userid = (String)session.getAttribute("userid");
		logger.info("전체 클릭 시, 로그인 된 유저의 아이디 체크, userid={} ", userid);
		
		MemberVO memberVo = memberService.selectMember(userid);
		logger.info("현재 로그인 한 유저 정보(마일리지), memberVo={}", memberVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.MILEAGE_RECORD_COUNT);
		pagingInfo.setCurrentPage(mileageVo.getCurrentPage());
		
		mileageVo.setRecordCountPerPage(Utility.MILEAGE_RECORD_COUNT);
		mileageVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list = null;
		if(userid!=null && !userid.isEmpty()) {
			mileageVo.setUserid(userid);
			mileageVo.setMileaebecSeq(mileaebecSeq);
			
			list = mileageService.selectAllMileage(mileageVo);
			logger.info("로그인 된 유저의 전체 마일리지 조회 결과, 파라미터 list.size={} ", list.size());
			logger.info("디버깅 list={} ", list);
			
			model.addAttribute("list", list);
		}
		
		int totalRecord=mileageService.selectTotalRecordforMileage(mileageVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("memberVo", memberVo);
		
		return "member/myMileageList";
	}
	
}
