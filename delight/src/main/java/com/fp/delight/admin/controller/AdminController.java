package com.fp.delight.admin.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.admin.model.AdminLoginService;
import com.fp.delight.admin.model.AdminMainService;
import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminLoginService adminLoginService;
	
	@Autowired
	private AdminMainService adminMainService;
	
	@RequestMapping("/adminMain.do")
	public void adminMain(Model model) {
		logger.info("관리자 모드 메인화면 보여주기");
		int todayInquery=adminMainService.todayInquery();
		int tomorInquery=adminMainService.tomorInquery();
		int todayRegister=adminMainService.todayRegister();
		int tomorRegister=adminMainService.tomorRegister();
		int tomorVisitor=adminMainService.tomorVisitor();
		int todayVisitor=adminMainService.todayVisitor();
		model.addAttribute("todayInquery",todayInquery );
		model.addAttribute("tomorInquery",tomorInquery );
		model.addAttribute("todayRegister",todayRegister );
		model.addAttribute("tomorRegister",tomorRegister );
		model.addAttribute("tomorVisitor",tomorVisitor );
		model.addAttribute("todayVisitor",todayVisitor );
	}
	
	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.GET)
	public void adminLogin_get() {
		logger.info("관리자 로그인 화면 보여주기");
	}
	
	@RequestMapping(value = "/adminLogin.do", method = RequestMethod.POST)
	public String adminLogin_post(@RequestParam String userid,
			@RequestParam String pwd, 
			@RequestParam(required = false) String chkSave,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		logger.info("관리자 로그인 처리, 파라미터 userid={}, pwd={}",userid, pwd);
		logger.info("chkSave={}",chkSave);
		
		int result=adminLoginService.adminLoginchk(userid, pwd);
		
		String msg="", url="/admin/adminLogin.do";
		if(result==MemberService.LOGIN_OK) {
			MemberVO vo=adminLoginService.selectAdmin(userid);
			HttpSession session=request.getSession();
			
			session.setAttribute("adminUserid", userid);
			session.setAttribute("adminUserName", vo.getUsername());
			Cookie ck=new Cookie("ck_admin", userid);
			ck.setPath("/");
			if(chkSave!=null) {
				ck.setMaxAge(1000*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			msg=vo.getUsername()+"님 로그인되었습니다.";
			url="/admin/adminMain.do";
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.NONE_USERID) {
			msg="존재하지 않는 아이디 입니다.";
		}else {
			msg="로그인 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/adminLogout.do")
	public String adminLogout(HttpSession session) {
		String userid=(String) session.getAttribute("adminUserid");
		
		logger.info("관리자 로그아웃 파라미터 userid={}",userid);
		
		int cnt=adminLoginService.adminLogout(userid);
		
		if(cnt>0) {
			session.removeAttribute("adminUserid");
			session.removeAttribute("adminUserName");
		}
		
		return "redirect:/index.do";
	}
	
	@RequestMapping("/adminLogout2.do")
	public String adminLogout2(HttpSession session) {
		String userid=(String) session.getAttribute("adminUserid");
		
		logger.info("관리자 로그아웃 파라미터 userid={}",userid);
		
		int cnt=adminLoginService.adminLogout(userid);
		
		if(cnt>0) {
			session.removeAttribute("adminUserid");
			session.removeAttribute("adminUserName");
		}
		
		return "redirect:/admin/adminLogin.do";
	}
	
	@RequestMapping(value="/adminPwdCg.do", method = RequestMethod.GET)
	public void adminPwdCg() {
		logger.info("관리자 비밀번호 변경 화면 보이기");
	}
	
	@RequestMapping(value="/adminPwdCg.do", method = RequestMethod.POST)
	@ResponseBody
	public int adminPwdCg_post(@RequestParam String currPwd,
			@RequestParam String cgPwd, HttpSession session) {
		String userid=(String) session.getAttribute("adminUserid");
		logger.info("관리자 비밀번호 변경 id={}",userid);
		logger.info("파라미터 cgPwd={}",cgPwd);
		MemberVO vo=new MemberVO();
		vo.setUserid(userid);
		vo.setPassword(cgPwd);
		
		int res=adminLoginService.adminPwdCg(vo);
		
		return res;
	}
}
