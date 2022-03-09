package com.kh.firstclass.user.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.user.member.model.dao.MemberDao;
import com.kh.firstclass.user.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession; //기존의 mybatis의 sqlSession을 대체 
	
	@Override
	public Member loginMember(Member m) {
		
		//memberDao.loginMember(sqlSession,m);
		System.out.println(memberDao.loginMember(sqlSession,m));
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

}
