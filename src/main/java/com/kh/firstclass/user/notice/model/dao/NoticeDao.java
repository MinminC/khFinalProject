package com.kh.firstclass.user.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public int countNoticeAll(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.countNoticeAll");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		ArrayList<Notice> list = (ArrayList)sqlSession.selectList("noticeMapper.selectImportantNotice");
		ArrayList<Notice> commons = (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
		System.out.println("전 : "+list);
		System.out.println("전 : "+commons);
		
		list.addAll(commons);
		System.out.println("후 : "+list);
		return list;
	}

	public Notice selectNoticeOne(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNoticeOne", noticeNo);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}

	public int countSearchNotice(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("noticeMapper.countSearchNotice", map);
	}

	public ArrayList<Notice> searchNoticeList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		ArrayList<Notice> list = (ArrayList)sqlSession.selectList("noticeMapper.selectImportantNotice");
		ArrayList<Notice> commons = (ArrayList)sqlSession.selectList("noticeMapper.searchNoticeList", map, rowBounds);
		System.out.println("전 : "+list);
		System.out.println("전 : "+commons);
		
		list.addAll(commons);
		System.out.println("후 : "+list);
		return list;
	}

}
