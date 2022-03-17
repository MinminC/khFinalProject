package com.kh.firstclass.user.member.model.service;


import java.text.DecimalFormat;
import java.text.Format;
import java.util.HashMap;
import java.util.Random;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.firstclass.common.mail.CertVo;

import com.kh.firstclass.common.model.vo.PageInfo;

import com.kh.firstclass.user.member.model.dao.MemberDao;
import com.kh.firstclass.user.member.model.vo.Inquiry;
import com.kh.firstclass.user.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession; //기존의 mybatis의 sqlSession을 대체 
	
	@Override
	public Member loginMember(Member m) {//로그인
		return memberDao.loginMember(sqlSession,m);
	}

	@Override
	public int insertMember(Member m) { //회원가입 
		
		//int result= memberDao.insertMember(sqlSession,m);
		
		//SqlSessionTemplate객체가 자동 commit을 해준다
		
		return memberDao.insertMember(sqlSession,m);
	}

	@Override
	public int idCheck(String checkId) {//아이디중복체크
		return memberDao.idCheck(sqlSession,checkId);
	}


	public String generateSecret() {//인증번호 만들기 
		Random r = new Random();
		int n = r.nextInt(100000);
		Format f = new DecimalFormat("000000"); //자리수가 비워져있어도 자동으로 채워지는 메소드 
		String secret = f.format(n); //랜덤수를 데시마 포맷에 넣어주기
		
		return secret;
	}
	
	
	@Override
	public String sendMail(String ip) {
		
		String secret = this.generateSecret();
		
		CertVo certVo = CertVo.builder().who(ip).secret(secret).build(); //bulider()생성자처럼 쓸 수 있는것 새로 객체 생성 안하고 필드순서 상관없이 쓸 수 있음 코드절약을 할 수잇다(롬복임)
		
		 memberDao.insertSecret(sqlSession, certVo);
		 
		 return secret;
	}

	@Override
	public boolean validate(CertVo certVo) {
		return memberDao.validate(sqlSession, certVo);
	}

	@Override
	public int searchPwd(Member m) {
		return memberDao.searchPwd(sqlSession, m);
	}

	@Override
	public int updatePwd(HashMap<String, Object> map) {
		return memberDao.updatePwd(sqlSession, map);
	}

	@Override
	public String searchId(Member m) {
		return memberDao.searchId(sqlSession,m);
	}

	

	

	// 문의하기
	@Override
	public int insertInquiry(Inquiry i) {
		return MemberDao.insertInquiry(sqlSession, i);
	}

	@Override
	public int selectListCount() {
		return memberDao.selectListCount(sqlSession);
	}
	

	@Override
	public ArrayList<Inquiry> selectList(PageInfo pi) {
		return memberDao.selectList(sqlSession, pi);
	}

	@Override
	public Inquiry selectInquiry(int no) {
		return memberDao.selectInquiry(sqlSession, no);
	}

	@Override
	public int deleteInquiry(int no) {
		return memberDao.deleteInquiry(sqlSession, no);
	}

	@Override
	public int updateInquiry(Inquiry i) {
		return memberDao.updateInquiry(sqlSession, i);
	}

	@Override
	public int updateEnrollForm(Member m) {
		return memberDao.updateEnrollForm(sqlSession, m);
	}

	@Override
	public int registReply(Inquiry i) {
		return memberDao.registReply(sqlSession, i);
	}

	@Override
	public int inquiryListCount(int userNo) {
		return memberDao.inquiryListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Inquiry> inquiryList(PageInfo pi, int userNo) {
		return memberDao.inquiryList(sqlSession, pi, userNo);
	}


}
