package com.kh.firstclass.user.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.firstclass.user.member.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// ������������ �̵�
	@RequestMapping("myPage.me")
	public String myPage() {
		return "user/member/myPage";
	}
	
	
}
