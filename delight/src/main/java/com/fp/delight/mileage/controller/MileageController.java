package com.fp.delight.mileage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.delight.mileage.model.MileageService;
import com.fp.delight.mileage.model.MileageVO;

@Controller
public class MileageController {
	private static final Logger logger
		= LoggerFactory.getLogger(MileageController.class);
	
	@Autowired
	private MileageService mileageService;
	
	@RequestMapping("/member/imp/myMileage.do")
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

			list = mileageService.earnMileage(mileageVo);
			logger.info("로그인 된 유저의 적립 마일리지 List결과, list={} ", list.size());
		
			model.addAttribute("list", list);
		}
		
		return "member/imp/myMileage";
	}
}
