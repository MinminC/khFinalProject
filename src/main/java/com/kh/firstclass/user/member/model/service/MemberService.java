package com.kh.firstclass.user.member.model.service;

import java.util.HashMap;

import com.kh.firstclass.common.mail.CertVo;
import com.kh.firstclass.user.member.model.vo.Member;

public interface MemberService {
	
	//로그인 서비스(select)
	Member loginMember(Member m);
	
	//회원가입 서비스(insert)
	int insertMember(Member m);
	
	//아이디 중복체크 서비스(select) count갯수로 select할거라서 int
	int idCheck(String checkId);
	
	//메일보내기
	String sendMail(String ip);
	
	//이메일인증
	boolean validate(CertVo certVo);

	//비밀번호 찾기
	int searchPwd(Member m);

	//임시비밀번호로 수정하기
	int updatePwd(HashMap<String, Object> map);

	//아이디찾기
	String searchId(Member m);

	

}
