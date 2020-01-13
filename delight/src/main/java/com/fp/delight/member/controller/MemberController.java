package com.fp.delight.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger
		= LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/register.do")
	public void register_get() {
		logger.info("회원가입 화면 보여주기");
	}
	
	@RequestMapping("/memberWrite.do")
	public String memberWrite(@ModelAttribute MemberVO memberVo, String email3,
			Model model, @RequestParam(required = false)String mailAgreement) {
		int result = 0;
		
		logger.info("회원가입 화면, 파라미터 memberVo={}", memberVo);
	
		if(mailAgreement!=null && !mailAgreement.isEmpty()) {
			memberVo.setMailAgreement("Y"); 
		}else if(mailAgreement==null || mailAgreement.isEmpty()){
			memberVo.setMailAgreement("N");
		}
		
		String hp1 = memberVo.getHp1();
		String hp2 = memberVo.getHp2();
		String hp3 = memberVo.getHp3();
		if(hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
			memberVo.setHp1("");
			memberVo.setHp2("");
			memberVo.setHp3("");
		}
		
		String email1 = memberVo.getEmail1();
		String email2 = memberVo.getEmail2();
		if(email1==null || email1.isEmpty()) {
			memberVo.setEmail2("");
		}else {
			if(email2.equals("etc")) {
				if(email3!=null && !email3.isEmpty()) {
					memberVo.setEmail2(email3);
				}else {
					memberVo.setEmail1("");
					memberVo.setEmail2("");
				}
			}
		}
		
		result = memberService.insertMember(memberVo);
		logger.info("유저 회원 가입 결과 result={}", result);
		
		String msg = "", url = "";
		if(result>0) {
			msg = "회원가입이 완료되었습니다!";
			url = "/index.do";
		}else {
			msg = "회원가입 실패!";
			url = "/member/register.do";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "common/message";
	}
	
	@RequestMapping("/agreement.do")
	public void agree_get() {
		logger.info("회원 약관 동의 화면 보여주기");
	}

	@RequestMapping("/checkUserid.do")
	public String checkUserid(@RequestParam(required = false) String userid,
			Model model) {
		logger.info("아이디 중복 확인 체크, 파라미터 userid={}", userid);
	
		int result = 0;
		
		if(userid!=null && !userid.isEmpty()) {
			result = memberService.selectDupUserid(userid);
			logger.info("아이디 중복확인 결과('0'=> 아이디 사용가능 '1'=> 아이디 중복), result={}", result);
		}
		
		model.addAttribute("USEFUL_ID", MemberService.USEFUL_ID);
		model.addAttribute("EXIST_ID", MemberService.EXIST_ID);
		model.addAttribute("result", result);
		
		return "member/checkUserid";
	}
}
