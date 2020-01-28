package com.fp.delight.email;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
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

import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;

@Controller
public class EmailController {
	private static final Logger logger
	=LoggerFactory.getLogger(EmailController.class);
	 	
	@Autowired EmailSender emailSender;
	
	@Autowired  MemberService memberService;
	
	@RequestMapping(value = "/login/findId.do",method = RequestMethod.POST)
	public String findId_post(@RequestParam String name,@RequestParam String email,Model model){
		String[] arr=email.split("@");
		
		MemberVO memberVo=new MemberVO();
		
		memberVo.setEmail1(arr[0]);
		memberVo.setEmail2(arr[1]);
		memberVo.setUsername(name);
		
		String userid=memberService.selectUserid(memberVo);
		
		String msg="",url="";
		if(userid==null || userid.isEmpty()) {
			msg="해당하는 정보가 일치하지않거나 존재하지않습니다!";
			url="/login/findId.do";
		}else {
			String subject="안녕하세요 Delight입니다."+memberVo.getUsername()+"님의 ID입니다.";
			String content=DM.dmUserIdInfo(userid);
			String receiver=memberVo.getEmail1()+"@"+memberVo.getEmail2();
			String sender="admin@herbmall.com";
			msg="이메일로 아이디 발송해드렸습니다.";
			url="/login/login.do";
			try {
				emailSender.sendMail(subject, content, receiver, sender);
				logger.info("이메일 발송 성공");
			} catch (MessagingException e) {
				logger.info("이메일 발송 실패!!");
				e.printStackTrace();
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}

	
	@RequestMapping(value = "/login/findPwd.do",method = RequestMethod.POST)
	public String findPwd_post(@RequestParam String userid,@RequestParam String name,
			@RequestParam String email,Model model) {
		String[] arr=email.split("@");
		
		MemberVO memberVo=new MemberVO();
		
		memberVo.setEmail1(arr[0]);
		memberVo.setEmail2(arr[1]);
		memberVo.setUsername(name);
		memberVo.setUserid(userid);
		
		int cnt=memberService.selectUserChkInfo(memberVo);
		logger.info("cnt={}",cnt);
		
		String msg="",url="/login/findPwd.do";
		if(cnt==MemberService.OK_INFO) {
			RandomKey rk=new RandomKey();
			String pwd=rk.excuteGenerate1();
			memberVo.setPassword(pwd);
			
			String subject="안녕하세요 Delight입니다."+memberVo.getUsername()+"님의 임시비밀번호 발급";
			String content=DM.dmUserPwdInfo(pwd);
			String receiver=memberVo.getEmail1()+"@"+memberVo.getEmail2();
			String sender="admin@herbmall.com";
			
			memberService.findePwdSet(memberVo);

			msg="임시비밀번호 발급완료!";
			url="/login/login.do";
			try {
				emailSender.sendMail(subject, content, receiver, sender);
				logger.info("이메일 발송 성공");
			} catch (MessagingException e) {
				logger.info("이메일 발송 실패!!");
				e.printStackTrace();
			}
		}else if(cnt==MemberService.NONE_USERID) {
			msg="아이디가 존재 하지않습니다.";
		}else if(cnt==MemberService.NO_INFO){
			msg="정보가 일치하지않습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/Certified.do")
	@ResponseBody
	public String write(@ModelAttribute MemberVO memberVo,@RequestParam(required = false) String email3) {
		
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
		
		RandomKey k=new RandomKey();
		String key=k.excuteGenerate();
		
		String subject="안녕하세요 Delight입니다.회원가입 인증번호입니다.";
		String content=DM.dmCertification(key);
		String receiver=memberVo.getEmail1()+"@"+memberVo.getEmail2();
		String sender="admin@herbmall.com";
		
		try {
			emailSender.sendMail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패!!");
			e.printStackTrace();
		}
		
		
		return key;
	}
	
	@RequestMapping(value = "member/memberOut.do",method = RequestMethod.POST)
	public String Out_post(@RequestParam int outReasonNo,HttpSession session,
			HttpServletResponse response,Model model) {
		String userid=(String)session.getAttribute("userid");
		
		MemberVO memberVo=memberService.selectMember(userid);
		
		memberVo.setOutReasonNo(outReasonNo);
		
		String msg="회원탈퇴중 문제발생",url="/member/memberOut.do";
		int cnt=memberService.withdrawMember(memberVo);
		if(cnt>0) {
			String subject="안녕하세요 Delight입니다.";
			String content=DM.dmWithdrawal(memberVo.getUsername());
			String receiver=memberVo.getEmail1()+"@"+memberVo.getEmail2();
			String sender="admin@herbmall.com";
			
			msg="이메일로 아이디 발송해드렸습니다.";
			url="/login/login.do";
			try {
				emailSender.sendMail(subject, content, receiver, sender);
				logger.info("이메일 발송 성공");
			} catch (MessagingException e) {
				logger.info("이메일 발송 실패!!");
				e.printStackTrace();
			}
			
			msg="회원탈퇴성공";
			url="/index.do";
			session.invalidate();
			Cookie ck=new Cookie("ck_userid", userid);
			ck.setPath("/");
			ck.setMaxAge(0);
			response.addCookie(ck);
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/sendTicketNum.do")
	@ResponseBody
	public void sendTicketNum(@RequestParam String unuseremail2,
			@RequestParam String ticketingNumber) {
		
		logger.info("비회원 -> 관람자 이메일 || 예매번호 , 파라미터 unuseremail2={} ticketingNumber={} ", unuseremail2, ticketingNumber);
	
		String subject="안녕하세요 Delight입니다. 구매하신 티켓의 예매번호입니다.";
		String content="예매번호 : "+ticketingNumber+"<br>예진아씨 : 펭수"+"<br>예진아씨 : 펭귄";
		String receiver=unuseremail2;
		String sender="admin@herbmall.com";
		
		try {
			emailSender.sendMail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패!!");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/sendTicketNumUser.do")
	@ResponseBody
	public void sendTicketNumUser(@RequestParam String useremail2,
			@RequestParam String ticketingNumber) {
		
		logger.info("비회원 -> 관람자 이메일 || 예매번호 , 파라미터 unuseremail2={} ticketingNumber={} ", useremail2, ticketingNumber);
	
		String subject="안녕하세요 Delight입니다. 구매하신 티켓의 정보 입니다.";
		String content="예매번호 : "+ticketingNumber+"\n";
		String receiver=useremail2;
		String sender="admin@herbmall.com";
		
		try {
			emailSender.sendMail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패!!");
			e.printStackTrace();
		}
	}
}




	


