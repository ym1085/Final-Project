package com.fp.delight.admin.controller;

import java.util.List;

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
import com.fp.delight.mypage.model.GradeVO;

@Controller
@RequestMapping("/admin/userManagement")
public class UserManageController {
	private static final Logger logger=LoggerFactory.getLogger(UserManageController.class);

	@Autowired
	private GradeManagerService gradeManagerService;
	
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
	public void userList() {
		logger.info("회원 목록 보이기");
	}
	
}

