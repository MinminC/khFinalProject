package com.kh.firstclass.user.member.model.service;


import java.util.HashMap;

import com.kh.firstclass.common.mail.CertVo;

import java.util.ArrayList;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Inquiry;

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


	// 문의하기(insert)
	int insertInquiry(Inquiry i);

	// 관리자 문의 내역 수(select)
	int selectListCount();

	
	// 관리자 문의 내역 조회(select)
	ArrayList<Inquiry> selectList(PageInfo pi);

	// 문의 상세보기(select)
	Inquiry selectInquiry(int no);

	// 나의 문의 삭제(update)
	int deleteInquiry(int no);

	// 나의 문의 수정(update)
	int updateInquiry(Inquiry i);

	// 개인정보 수정(update)
	int updateEnrollForm(Member m);

	// 문의 댓글 작성하기(insert)
	int registReply(Inquiry i);

	// 문의 내역 수(select)
	int inquiryListCount(int userNo);

	//  문의 내역 조회(select)
	ArrayList<Inquiry> inquiryList(PageInfo pi, int userNo);

	// 회원탈퇴
	int deleteMember(int userNo);

	// 비밀번호 변경
	int updatePassword(Member m);

	//

	
	
}
