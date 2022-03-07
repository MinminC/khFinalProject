package com.kh.firstclass.user.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.firstclass.user.member.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
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
	
	// 나의 리뷰 페이지로 이동
		@RequestMapping("myReview.me")
		public String myReview() {
			return "user/member/myReview";
		}
}
