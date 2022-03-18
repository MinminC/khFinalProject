package com.kh.firstclass.user.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public int countNoticeAll(SqlSessionTemplate sqlSession, int selectCategory) {
		System.out.println("잘들어옴?");
		return sqlSession.selectOne("noticeMapper.countNoticeAll", selectCategory);
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, int selectCategory, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);	


		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", selectCategory, rowBounds);
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
		
		return (ArrayList)sqlSession.selectList("noticeMapper.searchNoticeList", map, rowBounds);
	}

	public List<Map<Integer, String>> selectNoticeCategory(SqlSessionTemplate sqlSession) {
		return (List)sqlSession.selectList("noticeMapper.selectNoticeCategory");
	}

	public ArrayList<Notice> selectImportantNotice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectImportantNotice");
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.insertNotice", n);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteNoticeList(SqlSessionTemplate sqlSession, List<Integer> list) {
		return sqlSession.update("noticeMapper.deleteNoticeList", list);
	}

}
