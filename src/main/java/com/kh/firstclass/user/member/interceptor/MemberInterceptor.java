package com.kh.firstclass.user.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.firstclass.user.member.model.vo.Member;

public class MemberInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		if(!m.getMoNo().isEmpty()) {
		String moNo = m.getMoNo().get(0);
		
		m.setMoNo();
		
		for(int i = 0; i<moNo.length();i +=5) {
			m.setMoNo(moNo.substring(i,i+5));
		}
		session.setAttribute("loginUser", m);
		System.out.println(m);
		}
	
	
		super.afterCompletion(request, response, handler, ex);
	}

}
