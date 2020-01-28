package com.fp.delight.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.admin.userManagemet.model.GradeManagerService;
import com.fp.delight.admin.userManagemet.model.MemberListVO;
import com.fp.delight.admin.userManagemet.model.MemberManagerService;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mypage.model.GradeVO;

@Controller
@RequestMapping("/admin/userManagement")
public class UserManageController {
	private static final Logger logger=LoggerFactory.getLogger(UserManageController.class);

	@Autowired
	private GradeManagerService gradeManagerService;
	
	@Autowired
	private MemberManagerService memberManagerService;
	
	@RequestMapping("/gradeManagement.do")
	public void gradeManagement(Model model) {
		logger.info("등급별 혜택 관리 화면 보이기");
		List<GradeVO> list=gradeManagerService.gradeList();
		logger.info("검색 결과 list.size()={}",list.size());
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("/gradeSetting.do")
	public void gradeSetting(@RequestParam int gradeSeq,Model model) {
		logger.info("혜택 설정 변경 파라미터 gradeSeq={}",gradeSeq);
		
		GradeVO vo=gradeManagerService.gradeBySeqSel(gradeSeq);
		
		model.addAttribute("vo", vo);
		
	}
	
	@RequestMapping("/gradeEdit.do")
	@ResponseBody
	public int gradeEdit(@ModelAttribute GradeVO vo) {
		logger.info("등급별 혜택 변경 파라미터 vo={}",vo);
		
		int res=gradeManagerService.gradeEdit(vo);
		
		return res;
		
	}
	
	@RequestMapping("/userList.do")
	public void userList(MemberVO memberVo,Model model) {
		logger.info("회원 목록 보이기 파라미터 memberVo={}",memberVo);
		
		//비탈퇴 회원
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(memberVo.getCurrentPage());
		memberVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		memberVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		int noneTotal=memberManagerService.noneWithdrawalTotal(memberVo);
		pagingInfo.setTotalRecord(noneTotal);
		logger.info("비탈퇴 total={}",noneTotal);
		logger.info("비탈퇴 세팅 memberVo={}",memberVo);
		List<MemberVO> list=memberManagerService.noneWithdrawal(memberVo);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//탈퇴회원
		PaginationInfo pagingInfo2=new PaginationInfo();
		pagingInfo2.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo2.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo2.setCurrentPage(memberVo.getCurrentPage2());
		
		memberVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		memberVo.setFirstRecordIndex2(pagingInfo2.getFirstRecordIndex());
		
		int total=memberManagerService.withdrawalTotal(memberVo);
		
		pagingInfo2.setTotalRecord(total);
		logger.info("탈퇴회원 total={}",total);
		logger.info("탈퇴회원 세팅 memberVo={}",memberVo);
		
		List<Map<String, Object>> list2=memberManagerService.withdrawal(memberVo);
		
		model.addAttribute("list2", list2);
		model.addAttribute("pagingInfo2", pagingInfo2);
		
	}
	
	@RequestMapping("/forcedExit.do")
	@ResponseBody
	public int forcedExit(@RequestParam String userid) {
		logger.info("회원 강퇴 파라미터 userid={}",userid);
		
		int res=memberManagerService.forcedExit(userid);
		
		return res;
	}
	
	@RequestMapping("/cancle.do")
	@ResponseBody
	public int cancle(@RequestParam String userid) {
		logger.info("회원 탈퇴 취소 파라미터 userid={}",userid);
		
		int res=memberManagerService.cancle(userid);
		
		return res;
	}
	
	@RequestMapping("/multiforcedExit.do")
	public String multiforcedExit(@ModelAttribute MemberListVO memberListVo,
			Model model) {
		logger.info("멀티 강퇴 파라미터 memberListVo={}",memberListVo);
		
		List<MemberVO> list=memberListVo.getMemberList();
		
		int res=memberManagerService.multiforcedExit(list);
		String msg="강퇴 처리중 오류 발생", url="/admin/userManagement/userList.do";
		
		if(res>0) {
			msg="선택한 회원을 강퇴 처리 하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/multiCancle.do")
	public String multiCancle(@ModelAttribute MemberListVO memberListVo,
			Model model) {
		logger.info("멀티 탈퇴 취소 파라미터 memberListVo={}",memberListVo);
		
		List<MemberVO> list=memberListVo.getMemberList();
		
		int res=memberManagerService.multiCancle(list);
		
		String msg="탈퇴 취소 중 오류 발생", url="/admin/userManagement/userList.do";
		if(res>0) {
			msg="선택한 회원을 탈퇴 취소하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/inqueryList.do")
	public void inqueryList() {
		logger.info("문의 목록 화면 보이기");
	}
}

