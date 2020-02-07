package com.fp.delight.admin.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public void annWrite_get(HttpSession session) {
		String userid=(String) session.getAttribute("adminUserid");
		logger.info("userid={}",userid);
		Utility.urltag.remove(userid);
		logger.info("urltag={}",Utility.urltag.toString());
		logger.info("공지 작성 화면 보이기");
	}
	
	@RequestMapping(value = "/annSetting.do", method = RequestMethod.GET)
	public void annSetting_get() {
		logger.info("공지 설정 화면 보이기");
	}
	
	@RequestMapping(value = "/annWrite.do",method = RequestMethod.POST)
	public String annWrite_post(@ModelAttribute AnnVO annVo,
			HttpSession session,Model model) {
		String userid=(String) session.getAttribute("adminUserid");
		annVo.setUserid(userid);
		logger.info("공지글 등록 시작 파라미터 annVo={}",annVo);
		String urlt=Utility.urltag.get(userid);
		logger.info("urlt={}",urlt);
		annVo.setAnnImg(urlt);
		logger.info("imgurl 세팅후 annVo={}",annVo);
		String msg="", url="/admin/announcement/annWrite.do";
		int cnt=annService.annInsert(annVo);
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
		annVo.setFirstRecordIndex2(pagingInfo2.getFirstRecordIndex());
		
		int eventTotal=annService.eventTotal(annVo);
		
		pagingInfo2.setTotalRecord(eventTotal);
		logger.info("이벤트 공지 total={}",eventTotal);
		logger.info("이벤트 공지 세팅 annVo={}",annVo);
		
		List<AnnVO> list2=annService.eventSearch(annVo);
		logger.info("list.size()={},list2.size()={}",list.size(),list2.size());
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
	
	@RequestMapping("/normultiunex.do")
	public String normultiunex(@ModelAttribute AnnListVO annListVo,Model model) {
		logger.info("일반 공지 멀티 노출 취소 파라미터 annListVo={}",annListVo);
		
		List<AnnVO> list=annListVo.getAnnList();
		
		int cnt=annService.annUnExposure(list);
		String msg="노출 취소 설정 중 오류 발생", url="/admin/announcement/annInc.do";
		if(cnt>0) {
			msg="선택한 공지 글을 노출 취소 하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/entmultiex.do")
	public String entmultiex(@ModelAttribute AnnListVO annListVo,Model model) {
		logger.info("이벤트 공지 멀티 노출 설정 파라미터 annListVo={}",annListVo);
		List<AnnVO> list=annListVo.getAnnList();
		
		int cnt=annService.annMultiExpo(list);
		
		String msg="노출 설정 중 오류 발생", url="/admin/announcement/annInc.do";
		if(cnt>0) {
			msg="선택한 이벤트 글을 노출 설정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/entmultiunex.do")
	public String entmultiunex(@ModelAttribute AnnListVO annListVo,Model model) {
		logger.info("이벤트 공지 멀티 노출 취소 파라미터 annListVo={}",annListVo);
		
		List<AnnVO> list=annListVo.getAnnList();
		
		int cnt=annService.annUnExposure(list);
		String msg="노출 취소 설정 중 오류 발생", url="/admin/announcement/annInc.do";
		if(cnt>0) {
			msg="선택한 이벤트 글을 노출 취소 하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/multiDel.do")
	public String multiDel(@ModelAttribute AnnListVO annListVo,
			@RequestParam int type,HttpServletRequest req,Model model) {
		logger.info("파라미터 annListVo={}",annListVo);
		
		List<AnnVO> list=annListVo.getAnnList();
		//파일 삭제
		for(int i=0;i<list.size();i++) {
			AnnVO vo=list.get(i);
			int seq=vo.getAnnSeq();
			if(seq>0) {
				AnnVO annVo=annService.selAnnBySeq(seq);
				if(annVo.getAnnImg()!=null && annVo.getAnnImg()!="") {
					String path=annVo.getAnnImg();
					path=req.getContextPath()+path;
					File f=new File(path);
					if(f.exists()) {
						boolean bool=f.delete();
						logger.info("파일 삭제 결과 bool={}",bool);
					}
				}
			}
		}
		
		int cnt=annService.annMultiDel(list);
		String msg="삭제 중 오류 발생", url="/admin/announcement/annInc.do";
		if(cnt>0 && type==1) {
			msg="선택한 공지 글을 삭제 하였습니다.";
		}else if(cnt>0 && type==2) {
			msg="선택한 이벤트 글을 삭제하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/annDetail.do")
	public void annDetail(@RequestParam int annSeq,Model model) {
		logger.info("공지글 상세보기 파라미터 annSeq={}",annSeq);
		
		AnnVO vo=annService.selAnnBySeq(annSeq);
		
		logger.info("공지글 검색 결과 vo={}",vo);
		
		model.addAttribute("vo", vo);
		
		
	}
	
	@RequestMapping("/topChk.do")
	@ResponseBody
	public Object annTopChk(@RequestParam String type) {
		logger.info("상단 고정 있는지 확인하기 파라미터 type={}",type);
		Map<String, Object> map=new HashMap<String, Object>();
		int res=annService.anntopchk(type);
		logger.info("상단 고정 검색 결과 res={}",res);
		if(res==1) {
			AnnVO vo=annService.anntopinfo(type);
			map.put("topinfo", vo);
			map.put("result",res);
		}else {
			map.put("result", res);
		}
		
		return map;
		
	}
	
	@RequestMapping("/alTopCancle.do")
	@ResponseBody
	public int alTopCancle(@RequestParam int annSeq) {
		logger.info("전 상단글 내리기 파라미터 alseq={}",annSeq);
		
		int res=annService.unTopSetting(annSeq);
		
		return res;
	}
	
	@RequestMapping("/topsetting.do")
	@ResponseBody
	public int topsetting(@RequestParam int annSeq) {
		logger.info("상단 고정 파라미터 annSeq={}",annSeq);
		
		int res=annService.topSetting(annSeq);
		
		return res;
	}
	
	@RequestMapping("/topCancle.do")
	@ResponseBody
	public int topCancle(@RequestParam int annSeq) {
		logger.info("상단 고정 취소 파라미터 annSeq={}",annSeq);
		
		int res=annService.unTopSetting(annSeq);
		
		return res;
	}
	
	@RequestMapping("/expo.do")
	@ResponseBody
	public int expo(@RequestParam int annSeq) {
		logger.info("노출 설정 파라미터 annSeq={}",annSeq);
		
		int res=annService.annExpo(annSeq);
		
		return res;
	}
	
	@RequestMapping("/unExpo.do")
	@ResponseBody
	public int unexpo(@RequestParam int annSeq) {
		logger.info("노출 취소 파라미터 annSeq={}",annSeq);
		
		int res=annService.annUnExpo(annSeq);
		
		return res;
	}
	
	@RequestMapping("/annDel.do")
	@ResponseBody
	public int annDel(@RequestParam int annSeq, HttpServletRequest req) {
		logger.info("공지글 삭제 파라미터 annSeq={}",annSeq);
		AnnVO annVo=annService.selAnnBySeq(annSeq);
		if(annVo.getAnnImg()!=null && !annVo.getAnnImg().isEmpty()) {
			String path=annVo.getAnnImg();
			logger.info("path={}",path);
			File f=new File(path);
			if(f.exists()) {
				boolean bool=f.delete();
				logger.info("파일 삭제 결과 bool={}",bool);
			}
		}
		int res=annService.annDel(annSeq);
		
		return res;
	}
}
