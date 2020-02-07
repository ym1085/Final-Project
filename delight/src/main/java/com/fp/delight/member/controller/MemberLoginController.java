package com.fp.delight.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;

@Controller
@RequestMapping("/login")
public class MemberLoginController {
	private static final Logger logger
	= LoggerFactory.getLogger(MemberLoginController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/login.do",method = RequestMethod.GET)
	public String login_get(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		
		if(userid!=null && !userid.isEmpty()) {
			return "redirect:/index.do";
		}
		logger.info("회원 로그인 화면 보여주기");
		
		return "login/login";
	}
	
	@RequestMapping(value = "/login.do",method = RequestMethod.POST)
	public String login_post(@RequestParam String userid,@RequestParam String password,
			@RequestParam(required = false) String chkSave,
			Model model,HttpServletRequest request,HttpServletResponse response) {
			
			logger.info("userid={}",userid);
			
			int result=memberService.loginCheck(userid, password);
			
			String msg="",url="/login/login.do";
			if(result==MemberService.LOGIN_OK) {
				MemberVO memberVo=memberService.selectMember(userid);
				
				logger.info("memberVo={}",memberVo);
				
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("userName", memberVo.getUsername());
				
				Cookie ck=new Cookie("ck_userid", userid);
				ck.setPath("/");
				if(chkSave!=null) {
					ck.setMaxAge(1000*24*60*60);
					response.addCookie(ck);
				}else {
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
				
				msg=memberVo.getUsername()+"님 환영합니다.";
				url="/index.do";
				
			}else if(result==MemberService.DISAGREE_PWD) {
				msg="비밀번호가 일치하지 않습니다.";
			}else if(result==MemberService.NONE_USERID)   {
				msg="해당 아이디가 존재하지 않습니다.";			
			}else {
				msg="로그인 처리 실패!";			
			}
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		
		int cnt=memberService.updateLogOut(userid);
		if(cnt>0) {
			session.removeAttribute("userid");
			session.removeAttribute("userName");
		}
		
		return "redirect:/index.do";
	}
	
	@RequestMapping(value = "/findId.do",method = RequestMethod.GET)
	public void findId_get() {
		logger.info("아이디찾기 보여주기");
	}
	
	@RequestMapping(value = "/findPwd.do",method = RequestMethod.GET)
	public void findPwd_get() {
		logger.info("비밀번호 찾기 보여주기");
	}
	
}