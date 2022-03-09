package com.kh.firstclass.user.member.model.service;

import com.kh.firstclass.user.member.model.vo.Member;

public interface MemberService {
	
	//로그인 서비스(select)
	Member loginMember(Member m);
	
	//회원가입 서비스(insert)
	int insertMember(Member m);
	
	//아이디 중복체크 서비스(select) count갯수로 select할거라서 int
	int idCheck(String checkId);
	
	

}
