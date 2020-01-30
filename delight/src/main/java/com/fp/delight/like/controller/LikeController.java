package com.fp.delight.like.controller;

import java.util.HashMap;
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
import com.fp.delight.like.model.LikeService;
import com.fp.delight.like.model.LikeVO;
import com.fp.delight.performent.controller.PerformentAPI;
import com.fp.delight.performent.controller.PerformentController;

@Controller
public class LikeController {
	private final Logger logger
	= LoggerFactory.getLogger(PerformentController.class);
	
	@Autowired
	private LikeService likeService;
	
	@RequestMapping("/like.do")
	@ResponseBody
	public Map<String, Object> like(@RequestParam String perfomid,
			@RequestParam String performtitle,@RequestParam String performtype,
			HttpSession session) {
		
		String userid=(String)session.getAttribute("userid");
		
		logger.info("performtitle={}",performtitle);
		LikeVO likeVo=new LikeVO();
		Map<String, Object> map=new HashMap<String, Object>();
		int result=0;
		int count=0;
		String img="";
		if(userid!=null && !userid.isEmpty()) {
			likeVo.setUserid(userid);
			likeVo.setMt20id(perfomid);
			likeVo.setPrfnm(performtitle);
			likeVo.setGenre(performtype);
			
			result=likeService.selectLike(likeVo);
			
			if(result>0) {
				likeService.deleteLike(likeVo);
				count=likeService.selectLikeAll(perfomid);
				img="like";
				
			}else {
				likeService.insertLike(likeVo);
				count=likeService.selectLikeAll(perfomid);
				img="like2";
			}
		}
		
		map.put("img", img);
		map.put("count", count);
		
		return map;
	}
	
	
	@RequestMapping("/member/imp/mylike.do")
	public void mylike(HttpSession session,Model model) {
		
		String userid=(String)session.getAttribute("userid");
		List<Map<String, Object>> list=likeService.selectLikeNew5List(userid);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("/member/mylikeList.do")
	public void mylikeList(@ModelAttribute LikeVO likeVo,HttpSession session,Model model) {
		String userid=(String)session.getAttribute("userid");
		
		likeVo.setUserid(userid);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
		pagingInfo.setCurrentPage(likeVo.getCurrentPage());
		
		likeVo.setRecordCountPerPage(Utility.LIKE_RECORD_COUNT);
		likeVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list=likeService.selectLikeList2(likeVo);
		
		int totalRecord=likeService.selectTotalRecord(userid);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
	}
	
	@RequestMapping("/deleteLike.do")
	@ResponseBody
	public Object deleteLike(@RequestParam String perfomid,HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		
		LikeVO likeVo=new LikeVO();
		
		likeVo.setUserid(userid);
		likeVo.setMt20id(perfomid);
	
		int cnt=likeService.deleteLike(likeVo);
		
		return cnt;
	}
	
}
