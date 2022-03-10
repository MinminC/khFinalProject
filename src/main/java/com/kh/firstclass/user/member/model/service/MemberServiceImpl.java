package com.kh.firstclass.user.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession,m);
	}

	@Override
	public int insertMember(Member m) {
		return 0;
	}

	@Override
	public int idCheck(String checkId) {
		return 0;
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

}
