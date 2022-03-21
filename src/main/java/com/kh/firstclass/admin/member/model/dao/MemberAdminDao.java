package com.kh.firstclass.admin.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Member;

@Repository
public class MemberAdminDao {


	public int selectMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectMemberCount");
	}

	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit); //페이징 쿼리문 대체해줌
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMember",null,rowBounds);
	}

	public int adminDeleteMember(SqlSessionTemplate sqlSession, ArrayList list) {
		return sqlSession.update("memberMapper.adminDeleteMember",list);
	}

	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.selectSearchCount",map);
	}

	public ArrayList<Member> adminSearchMember(SqlSessionTemplate sqlSession, PageInfo pi,HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit); //페이징 쿼리문 대체해줌
		
		return (ArrayList)sqlSession.selectList("memberMapper.adminSearchMember",map,rowBounds);
	}


	
	

}
