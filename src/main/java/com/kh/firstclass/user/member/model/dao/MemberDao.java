package com.kh.firstclass.user.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Inquiry;
import com.kh.firstclass.user.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember",m);//loginUser는 한행오니까
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
	
	
	

}
