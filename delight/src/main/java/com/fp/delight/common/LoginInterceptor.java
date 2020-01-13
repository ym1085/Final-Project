package com.fp.delight.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger
		=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("컨트롤러 수행 전 먼저 호출 - preHandle()");
		//잠깐만
		HttpSession session=request.getSession();
		String userid=(String) session.getAttribute("userid");
		if(userid==null || userid.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			
			out.print("<script type='text/javascript'>");
			out.print("alert('로그인 하세요.');");
			out.print("location.href='"+request.getContextPath()
				+"/member/login.do';");
			out.print("</script>");
			
			return false; //다음 컨트롤러를 수행하지 않음
		}
		
		return true; //다음 컨트롤러를 정상적으로 수행

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("컨트롤러 수행 후 호출 - postHandle()");		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("뷰 생성되어 클라이언트에 응답된 후 호출 - afterCompletion()");		
	}

}
