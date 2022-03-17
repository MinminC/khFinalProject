package com.kh.firstclass.user.member.model.dao;


import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.common.mail.CertVo;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Inquiry;

import com.kh.firstclass.user.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {//로그인
		
		return sqlSession.selectOne("memberMapper.loginMember",m);//loginUser는 한행오니까
	}


	public int insertMember(SqlSessionTemplate sqlSession, Member m) {//회원가입
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {//아이디중복체크
		return sqlSession.selectOne("memberMapper.idCheck",checkId);
	}

	public int insertSecret(SqlSessionTemplate sqlSession, CertVo certVo) {//인증번호 db삽입
	
	return sqlSession.insert("memberMapper.regist",certVo);
	
	}

	public boolean validate(SqlSessionTemplate sqlSession, CertVo certVo) {
		CertVo result = sqlSession.selectOne("memberMapper.validate",certVo);
		
		if(result!=null) {
		sqlSession.delete("memberMapper.remove",certVo);//이미 위에서 result에 값을 담았기떄문에 db에서 지워도됌
		}
		
		return result!=null; //result가 널이 아닐때 true 리턴 널이면 false 반환형이 boolean이라 
	}

	public int searchPwd(SqlSessionTemplate sqlSession,Member m) {
		
		return sqlSession.selectOne("memberMapper.searchPwd",m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("memberMapper.updatePwd",map);
	}

	public String searchId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.searchId",m);
	}
	

	// 문의하기
	public static int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		return sqlSession.insert("memberMapper.insertInquiry", i);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	

	public ArrayList<Inquiry> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	}

	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("memberMapper.selectInquiry", no);
	}

	public int deleteInquiry(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("memberMapper.deleteInquiry", no);
	}

	public int updateInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		return sqlSession.update("memberMapper.updateInquiry", i);
	}

	public int updateEnrollForm(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateEnrollForm", m);
	}

	public int registReply(SqlSessionTemplate sqlSession, Inquiry i) {
		return sqlSession.update("memberMapper.registReply", i);
	}

	public int inquiryListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.inquiryListCount", userNo);
	}

	public ArrayList<Inquiry> inquiryList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.inquiryList", userNo, rowBounds);
	}

	
	
	

}
