package com.kh.firstclass.user.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.firstclass.user.member.model.service.MemberService;
import com.kh.firstclass.user.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//로그인 화면으로 이동
	@RequestMapping("loginForm.me")
	public String loginMember() {
		return "user/member/loginMember";
	} 
	
	// 메인 페이지로 이동
	@RequestMapping("myPage.me")
	public String myPage() {
		return "user/member/myPage";
	}
	
	// 개인정보 변경 페이지로 이동
	@RequestMapping("update.me")
	public String updateMember() {
		return "user/member/updateMember";
	}
	
	// 비밀번호 변경 페이지로 이동
	@RequestMapping("update.pwd")
	public String updatePassword() {
		return "user/member/updatePassword";
	}
	
	// 나의 일정 페이지로 이동
	@RequestMapping("mySchedule.me")
	public String mySchedule() {
		return "user/member/mySchedule";
	}

		//로그인
		@RequestMapping("login.me")
		public ModelAndView loginMember(Member m, ModelAndView mv,HttpSession session) {
			
			Member loginUser = memberService.loginMember(m);
			//System.out.println(loginUser);
			
			if(loginUser==null) { //로그인실패 =>에러문구를 requestScope에 담고 에러페이지로 포워딩
				
				mv.addObject("errorMsg","에러발생");
				mv.setViewName("common/errorPage");
				
				
			}else {//로그인 성공 => loginUser를 sessionScope에 담고 메인페이지 url로 재요청
				
				session.setAttribute("loginUser", loginUser);
				System.out.println(loginUser);
				mv.setViewName("redirect:/");
			}
			
			return mv;
		}
		
		//회원가입화면으로 이동
		@RequestMapping("enrollForm.me")
		public String memberEnrollForm() {
			return "user/member/memberEnrollForm";
		}
		
		@RequestMapping("logout.me")
		public String logoutMember(HttpSession session) {//로그인 세션 만료시키기
			
			session.invalidate();
			
			return "redirect:/";
		}
	
 
	// 나의 리뷰 페이지로 이동
  @RequestMapping("myReview.me")
	public String myReview() {
		return "user/member/myReview";
	}
		
	// 나의 리뷰 페이지로 이동
	@RequestMapping("myInquiry.me")
	public String myInquiry() {
		return "user/member/myInquiry";
	}	
}
