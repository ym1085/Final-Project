package com.fp.delight.like.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.like.model.LikeService;
import com.fp.delight.like.model.LikeVO;
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
			@RequestParam String performtitle,HttpSession session) {
		
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
	
}
