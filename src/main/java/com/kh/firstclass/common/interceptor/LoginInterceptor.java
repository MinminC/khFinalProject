package com.kh.firstclass.common.interceptor;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.firstclass.user.member.model.vo.Member;
public class LoginInterceptor extends HandlerInterceptorAdapter{
	//-로그인 유무 판단, 회원의 권한 체크
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
//		//true 리턴 시 -> 기존 요청 흐름대로 해당 Controller 정상 실행
//		//false 리턴 시 -> Controller 실행되지 않음
//		
//		HttpSession session = request.getSession();
//		//현재 요청을 보낸 사람이 로그인 되어있는 경우 -> Controller 실행
//		if(session.getAttribute("loginUser") != null)
//			return true;
//		else {
//			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스 입니다.");
//			response.sendRedirect(request.getContextPath());
//			return false;
//		}
//	}

}