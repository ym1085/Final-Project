package com.fp.delight.admin.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
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

import com.fp.delight.admin.userManagemet.model.AdminPromotionService;
import com.fp.delight.admin.userManagemet.model.GradeManagerService;
import com.fp.delight.admin.userManagemet.model.InqAnwService;
import com.fp.delight.admin.userManagemet.model.InqAnwVO;
import com.fp.delight.admin.userManagemet.model.MemberListVO;
import com.fp.delight.admin.userManagemet.model.MemberManagerService;
import com.fp.delight.admin.userManagemet.model.PromotionListVO;
import com.fp.delight.common.FileUploadUtil;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.SearchVO;
import com.fp.delight.common.Utility;
import com.fp.delight.email.DM;
import com.fp.delight.email.EmailSender;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.mypage.model.GradeVO;
import com.fp.delight.promotion.model.PromotionVO;

@Controller
@RequestMapping("/admin/userManagement")
public class UserManageController {
	private static final Logger logger=LoggerFactory.getLogger(UserManageController.class);

	@Autowired
	private GradeManagerService gradeManagerService;
	
	@Autowired EmailSender emailSender;
	
	@Autowired
	private MemberManagerService memberManagerService;
	
	@Autowired
	private InqAnwService inqAnwService;
	
	@Autowired
	private AdminPromotionService adminPromotionService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
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
	public void inqueryList(@ModelAttribute SearchVO searchVo,Model model) {
		logger.info("문의 목록 화면 보이기 파라미터 searchVo={}",searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(Utility.ANNBLOCK_SIZE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=inqAnwService.adminInqSelTotal(searchVo);
		logger.info("문의 목록 total={}",totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		List<Map<String, Object>> list=inqAnwService.adminInqSel(searchVo);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	@RequestMapping("/inqAnwDetail.do")
	public void inqAnwDetail(@RequestParam int inqSeq, Model model) {
		logger.info("문의 답변 상세 보기 파라미터 inqSeq={}",inqSeq);
		
		Map<String, Object> map=inqAnwService.inqDetail(inqSeq);
		int anwCk=inqAnwService.anwCk(inqSeq);
		logger.info("검색결과 map={}",map.toString());
		model.addAttribute("map", map);
		model.addAttribute("ck", anwCk);
	}
	
	@RequestMapping("/answer.do")
	@ResponseBody
	public int answer(@ModelAttribute InqAnwVO inqAnwVo,HttpSession session) {
		logger.info("문의답변 파라미터 inqAnwVo={}",inqAnwVo);
		String userid=(String) session.getAttribute("adminUserid");
		int inqSeq=inqAnwVo.getInquerySeq();
		inqAnwVo.setUserid(userid);
		
		logger.info("답변하는 사람 아이디 setting 결과 inqAnwVo={}",inqAnwVo);
		
		Map<String, Object> map=inqAnwService.inqDetail(inqSeq);
		String inqueryContent=(String) map.get("INQUERY_CONTENT");
		String subject="안녕하세요 Delight입니다. 문의하신 내용에 대한 답변입니다.";
		String content=DM.answer(inqueryContent, inqAnwVo.getInqanwContent());
		String receiver=(String) map.get("EMAIL");
		String sender="admin@delight.com";
		
		int res=inqAnwService.anwComplanw(inqAnwVo);
		logger.info("답변 결과 res={}",res);
		try {
			emailSender.sendMail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패!!");
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	@RequestMapping("/paymentList.do")
	public void paymentList(@ModelAttribute MemberVO memberVo,Model model) {
		logger.info("결제 목록 보기 파라미터 memberVo={}",memberVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
		pagingInfo.setCurrentPage(memberVo.getCurrentPage());
		
		memberVo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
		memberVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int total=memberManagerService.paymentTotal(memberVo);
		logger.info("결제 목록 total={}",total);
		pagingInfo.setTotalRecord(total);
		
		List<Map<String, Object>> list=memberManagerService.paymentList(memberVo);
		
		logger.info("결제 목록 검색 결과 list.size()={}",list.size());
		if(list.size()>0) {
			Map<String, Object> map=list.get(0);
			String prfnm=(String) map.get("PRFNM");
			if(prfnm==null || prfnm.isEmpty()) {
				list.remove(0);
			}
		}
		int totalpay=memberManagerService.totalpayment(memberVo.getUserid());
		int totalrefund=memberManagerService.totalrefund(memberVo.getUserid());
		
		model.addAttribute("list", list);	
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("totalpay", totalpay);
		model.addAttribute("totalrefund", totalrefund);
		
		
	}
	
	@RequestMapping("/promotionBoardList.do")
	public void promotionBoardList(@ModelAttribute PromotionVO promotionVo,
			Model model) {
		logger.info("홍보게시판 파라미터 promotionVo={}",promotionVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.ANNBLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.SETTING_RECORD_COUNT);
		pagingInfo.setCurrentPage(promotionVo.getCurrentPage());
		
		promotionVo.setRecordCountPerPage(Utility.ANNBLOCK_SIZE);
		promotionVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		int totalRecord=adminPromotionService.promotiontotal(promotionVo);
		
		logger.info("홍보글 totalRecord={}",totalRecord);
		
		List<PromotionVO> list=adminPromotionService.promotionList(promotionVo);
		logger.info("검색 결과 list.size()={}",list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
	}
	
	@RequestMapping("/promotionDetail.do")
	public void promotionDetail(@RequestParam int proseq,Model model) {
		logger.info("홍보글 상세보기 파라미터 proseq={}",proseq);
		
		PromotionVO vo=adminPromotionService.promotionDetail(proseq);
		
		logger.info("검색 결과 vo={}",vo);
		
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("/promoDelDetail.do")
	@ResponseBody
	public int promoDetailDel(@RequestParam int proseq,HttpServletRequest request) {
		logger.info("홍보글 상세보기에서 삭제하기 파라미터 proseq={}",proseq);
		
		PromotionVO vo=adminPromotionService.promotionDetail(proseq);
		String path=fileUtil.getFilePath(request, FileUploadUtil.PROMOTION_UPLOAD);
		path=path+"/"+vo.getPromoteP1();
		logger.info("path={}",path);
		File f=new File(path);
		int cnt=adminPromotionService.promoDel(proseq);
		
		if(cnt>0) {
			if(f.exists()) {
				boolean bool=f.delete();
				logger.info("삭제 결과 bool={}",bool);
			}
		}
		
		return cnt;
	}
	
	@RequestMapping("/promoDel.do")
	public String promoDel(@RequestParam int proseq,HttpServletRequest request,Model model) {
		logger.info("홍보글목록에서 삭제 파라미터 proseq={}",proseq);
		
		PromotionVO vo=adminPromotionService.promotionDetail(proseq);
		String path=fileUtil.getFilePath(request, FileUploadUtil.PROMOTION_UPLOAD);
		path=path+"/"+vo.getPromoteP1();
		File f=new File(path);
		int cnt=adminPromotionService.promoDel(proseq);
		
		String msg="삭제중 오류 발생", url="/admin/userManagement/promotionBoardList.do";
		if(cnt>0) {
			if(f.exists()) {
				boolean bool=f.delete();
				logger.info("삭제 결과 bool={}",bool);
				msg="해당 홍보글 삭제 완료";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/multiDel.do")
	public String multiDel(@ModelAttribute PromotionListVO promotionListVo,HttpServletRequest request,
			Model model) {
		logger.info("홍보글 멀티 삭제 파라미터 promotionListVo={}",promotionListVo);
		
		List<PromotionVO> list=promotionListVo.getPromotionList();
		
		
		for(int i=0;i<list.size();i++) {
			PromotionVO vo=list.get(i);
			int proseq=vo.getPromoteSeq();
			if(proseq>0) {
				PromotionVO vo2=adminPromotionService.promotionDetail(proseq);
				logger.info("vo2={}",vo2);
				String path=fileUtil.getFilePath(request, FileUploadUtil.PROMOTION_UPLOAD);
				path=path+"/"+vo2.getPromoteP1();
				File f=new File(path);
					if(f.exists()) {
						boolean bool=f.delete();
						logger.info("삭제 결과 bool={}",bool);
					}
			}
		}//for
		
		int cnt=adminPromotionService.promoMultiDel(list);
		
		String msg="멀티삭제중 오류 발생", url="/admin/userManagement/promotionBoardList.do";
		if(cnt>0) {
			msg="선택한 홍보글 삭제 완료";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}

