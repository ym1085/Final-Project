package com.fp.delight.performent.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

///performance/pfDetail.do?mt20id=${vo.mt20id }'/>">
@Controller
@RequestMapping("/performance")
public class PerformentController {
	private final Logger logger
		= LoggerFactory.getLogger(PerformentController.class);
	
	@RequestMapping("/pfDetail.do")
	public String performentList_post(@RequestParam String perfomid,
			Model model) {
		logger.info("메인 페이지 공연 포스터 클릭=>, 공연 아이디 perfomid : ,"+perfomid);
		
		PerformentAPI perform = null; 
		Map<String, Object> map = null;
		List<String> arr = null;
		if(perfomid!=null && !perfomid.isEmpty()) {
				perform = new PerformentAPI();
				PerformentAPIPoster poster=new PerformentAPIPoster();
				
				map = perform.performDetail(perfomid);
				Map<String, Object> m=poster.performDetailPoster(perfomid);
				if(m.get("imgstr")!=null) {
					model.addAttribute("img", m.get("imgstr"));	//공연 상세보기 
				}else if(m.get("imgstrArr")!=null) {
					model.addAttribute("img", m.get("imgstrArr"));	//공연 상세보기 
				}
		
			logger.info("공연 상세보기 메서드 호출 결과, map={} arr={}", map, arr);
			model.addAttribute("arr", arr);		//공연 상세보기 포스터 데이터
		}
		
		return "performance/pfDetail";
	}
}
