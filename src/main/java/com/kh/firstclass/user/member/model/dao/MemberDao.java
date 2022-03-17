package com.kh.firstclass.user.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.common.mail.CertVo;
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
	
	
	
	

}
