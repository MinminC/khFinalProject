package com.kh.firstclass.user.schedule.scheduleInterseptor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.firstclass.user.member.model.vo.Member;

public class ScheduleInterseptor implements HandlerInterceptor {
	
	@Override //전처리
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//모임번호 추가 로직에서 모임번호를 리스트로 가지고있는것을 하나의 문자로 만들어서 요청을 보내고
		HttpSession session  = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		if(!m.getMoNo().isEmpty()) {
		ArrayList<String> Mono = m.getMoNo();
		
		String resultMono = Mono.get(0).toString();
		
		request.setAttribute("resultMono", resultMono);
		}
		
		// TODO Auto-generated method stub
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
//	
	@Override //후처리
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	

}
