package com.fp.delight.recent.controller;

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

import com.fp.delight.common.IPUtility;
import com.fp.delight.common.PaginationInfo;
import com.fp.delight.common.Utility;
import com.fp.delight.performent.controller.PerformentAPI;
import com.fp.delight.recent.model.RecentService;
import com.fp.delight.recent.model.RecentVO;

@Controller
public class RecentController {
	private static final Logger logger
	=LoggerFactory.getLogger(RecentController.class);
	
	@Autowired
	private RecentService recentService;
	
	@RequestMapping("/recentInsert.do")
	public String insertrecent(HttpSession session,@RequestParam String perfomid) {
		String userid=(String)session.getAttribute("userid");
		
		String iporid="";

		
		if(userid!=null && !userid.isEmpty()){
			iporid=userid;
		}else{
			IPUtility ip=new IPUtility();
			iporid=ip.Url();
		}
		 
		logger.info("perfomid={}",perfomid);
		logger.info("iporid={}",iporid);
		RecentVO recentVo=new RecentVO();
		
		PerformentAPI perfom=new PerformentAPI();
		Map<String, Object> map=perfom.performDetail(perfomid);
		
		recentVo.setIporid(iporid);
		recentVo.setMt20id(perfomid);
		recentVo.setPrfnm((String)map.get("prfnm"));
		logger.info("prfnm={}",(String)map.get("prfnm"));
		
		int count=recentService.selectChkRecent(recentVo);
		if(count>0) {
			return "redirect:/performance/pfDetail.do?perfomid="+perfomid;
		}else {
			recentService.insertRecent(recentVo);
		}
		
		
		return "redirect:/performance/pfDetail.do?perfomid="+perfomid;
	}
	
	@RequestMapping("/member/imp/mynewPer.do")
	public void mysnewPer(HttpSession session,Model model) {
		String userid=(String)session.getAttribute("userid");
		
		List<RecentVO> list=recentService.selectRecentNew5List(userid);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("/member/mysnewPerList.do")
	public void mysnewPerList(@ModelAttribute RecentVO recentVo,HttpSession session,Model model) {
		String userid=(String)session.getAttribute("userid");

		recentVo.setIporid(userid);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
		pagingInfo.setCurrentPage(recentVo.getCurrentPage());
		
		recentVo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
		recentVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<RecentVO> list=recentService.selectRecentList(recentVo);
		
		int totalRecord=recentService.selectTotalRecord(userid);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
	}
}
