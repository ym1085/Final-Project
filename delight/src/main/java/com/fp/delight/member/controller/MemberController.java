package com.fp.delight.member.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.delight.member.model.MemberService;
import com.fp.delight.member.model.MemberVO;
import com.fp.delight.member.model.PremiumVO;

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
			Model model,@RequestParam(required = false)String mailAgreement) {
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
			url = "/login/login.do";
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
	
	@RequestMapping(value = "/edit.do",method = RequestMethod.GET)
	public void edit_get(HttpSession session,Model model) {
		logger.info("수정화면보여주기");
		String userid=(String)session.getAttribute("userid");
		MemberVO memberVo =memberService.selectMember(userid);
		
		model.addAttribute("memberVo",memberVo);
	}
	
	@RequestMapping(value = "/edit.do",method = RequestMethod.POST)
	public String edti_post(@ModelAttribute MemberVO memberVo,
			@RequestParam(required = false) String email3,
			HttpSession session, Model model,@RequestParam(required = false)String mailAgreement) {
		
		String userid=(String)session.getAttribute("userid");
		
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
		
		int result=memberService.loginCheck(userid, memberVo.getPassword());
		
		String msg="",url="/member/edit.do";
		if(result==MemberService.LOGIN_OK) {
			int cnt=memberService.updateMember(memberVo);
			if(cnt>0) {
				msg="정보가 수정되었습니다.";
			}else {
				msg="정보 수정실패 ㅠㅠ";
			}
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지않습니다.";
		}else {
			msg="비밀번호체크실패!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/memberOut.do",method = RequestMethod.GET)
	public void Out_get(Model model,HttpSession session) {
		logger.info("탈퇴화면보여주기");
		String userid=(String)session.getAttribute("userid");
		List<Map<String, Object>> list=memberService.selectOut();
		
		MemberVO memberVo=memberService.selectMember(userid);
		
		model.addAttribute("list",list);
		model.addAttribute("memberVo",memberVo);
	}
	
	@RequestMapping("/checkUserId.do")
	@ResponseBody
	public boolean checkUserid(@RequestParam String userid,
			Model model) {
		logger.info("유저 아이디 중복체크, 아이디 userid={}", userid);
		
		int result = 0;
		if(userid!=null && !userid.isEmpty()) {
			result = memberService.selectDupUserid(userid);
			logger.info("중복체크 결과 result={}", result);
		}
		
		boolean bool = false;
		if(result==MemberService.EXIST_ID) {
			bool = false;	//아이디 존재
		}else {
			bool = true;	//아이디 사용 가능
		}
		
		return bool;
	}
	
	@RequestMapping("/myPage.do")
	public String showMypage() {
		logger.info("마이페이지 화면 보여주기");
		
		return "member/myPage";
	}
	
	//회원 맴버쉽 구매
	@RequestMapping("/buyMembership.do")
	public String buyMemberShip(HttpSession session, Model model,
			@RequestParam String membershipName, @RequestParam String membershipDetail) {
		
		String userid = (String)session.getAttribute("userid");
		logger.info("로그인 한 유저 아이디 확인하기, 파라미터 userid={} ", userid);
		
		logger.info("맴버쉽 구매 import 화면 보여주기, 파라미터 membershipName={} membershipDetail={} "
				, membershipName, membershipDetail);
		
		String name = membershipName;
		logger.info("회원 맴버쉽 이름, name={} ", name);
		String detail = membershipDetail;
		logger.info("회원 맴버쉽 상세 설명 detail={} ", detail);
		
		String [] splitstr = membershipDetail.split(":");
		
		String detailPer = splitstr[1];
		logger.info("문자 분리 후 detail 체크, detailPer={} ", detailPer);
		
		String [] detailPerFinal = detailPer.split("%");
		logger.info("문자 분리 후 2번째 detail체크, detailPerFinal={} ", detailPerFinal);
		
		detail = detailPerFinal[0];
		logger.info("최종 필요한 파라미터, 10% ==> '10'셋팅 detail={} ", detail);
		
		MemberVO memberVo = null;
		String email="";
		String email1="";
		String email2="";
		
		String hp = "";
		String hp1 = "";
		String hp2 = "";
		String hp3 = "";
		if(userid!=null && !userid.isEmpty()) {
			memberVo = memberService.selectMember(userid);
			logger.info("로그인 한 유저의 상세정보, memberVo={} ", memberVo);
		
			//이메일
			email1 = memberVo.getEmail1();
			email2 = memberVo.getEmail2();
			
			//전화번호
			hp1 = memberVo.getHp1();
			hp2 = memberVo.getHp2();
			hp3 = memberVo.getHp3();
			
			if(email1!=null && !email1.isEmpty() && email2!=null && !email2.isEmpty()) {
				email=email1+"@"+email2;
				logger.info("회원의 이메일 결합 importMemberShip에서 사용, email={} ", email);
		
			}
			
			if(hp1!=null && !hp1.isEmpty() && hp2!=null && !hp2.isEmpty() && hp3!=null && !hp3.isEmpty()) {
				hp = hp1+"-"+hp2+"-"+hp3;
				logger.info("로그인 한 일반회원의 전화번호={} ", hp);
			}
			model.addAttribute("email", email);	//이메일
			model.addAttribute("hp", hp);
		}
		
		model.addAttribute("userid", userid);		//ID
		model.addAttribute("name", name);			//회원 맴버쉽 이름
		model.addAttribute("detail", detail);		//회원 맴버쉽 상세설명
		model.addAttribute("memberVo", memberVo);	//회원 정보
		
		return "performance/importMemberShip";
	}
	
	@RequestMapping("/buyMembershipUser.do")
	public String buybuyMemberShipUser(@RequestParam String userid, @RequestParam String name,
									   @RequestParam String detail, Model model) {
		
		//USERID는 확인차 계속 넘겨주고 있습니다.
		logger.info("importMemberShip으로부터 넘어오는 파라미터, userid={} name={} ", userid, name);
		logger.info("importMemberShip으로부터 넘어오는 파라미터, detail={} ", detail);
		
		PremiumVO premiumVo = new PremiumVO();
		premiumVo.setName(name);
		premiumVo.setDetail(detail);
		premiumVo.setUserid(userid);
		
		if(userid!=null && !userid.isEmpty()) {
			int result = memberService.buymemberShip(premiumVo);
			logger.info("맴버쉽 결제 결과, result={} ", result);
		}
		
		return "redirect:/index.do";
	}
}
