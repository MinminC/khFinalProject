package com.kh.firstclass.admin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.firstclass.user.member.model.service.MemberService;
@Controller
public class MemberAdministration {

	@Autowired
	private MemberService memberService;
	
	//회원관리화면으로 이동 
	@RequestMapping("admin.me")
	public String loginMember() {
		return "admin/member/memberController";
	} 
	
	
	
	
	
	
}
