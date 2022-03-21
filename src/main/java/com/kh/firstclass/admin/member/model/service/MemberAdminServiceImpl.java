package com.kh.firstclass.admin.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.admin.member.model.dao.MemberAdminDao;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Member;



@Service
public class MemberAdminServiceImpl implements MemberAdminService{
	
	@Autowired
	private MemberAdminDao memberAdminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int selectMemberCount() {
		return memberAdminDao.selectMemberCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMember(PageInfo pi) {
		return memberAdminDao.selectMember(sqlSession,pi);
	}

	@Override
	public int adminDeleteMember(ArrayList list) {
		return memberAdminDao.adminDeleteMember(sqlSession,list);
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return memberAdminDao.selectSearchCount(sqlSession,map);
	}

	@Override
	public ArrayList<Member> adminSearchMember(PageInfo pi, HashMap<String, String> map) {
		return memberAdminDao.adminSearchMember(sqlSession,pi,map);
	}
	
	
}
