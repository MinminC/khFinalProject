package com.kh.firstclass.user.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.notice.model.dao.NoticeDao;
import com.kh.firstclass.user.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int countNoticeAll(int selectCategory) {
		return noticeDao.countNoticeAll(sqlSession, selectCategory);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(int selectCategory, PageInfo pi) {
		return noticeDao.selectNoticeList(sqlSession, selectCategory, pi);
	}

	@Override
	public Notice selectNoticeOne(int noticeNo) {
		return noticeDao.selectNoticeOne(sqlSession, noticeNo);
	}

	@Override
	public int increaseCount(int noticeNo) {
		return noticeDao.increaseCount(sqlSession, noticeNo);
	}

	@Override
	public int countSearchNotice(HashMap<String, String> map) {
		return noticeDao.countSearchNotice(sqlSession, map);
	}

	@Override
	public ArrayList<Notice> searchNoticeList(HashMap<String, String> map, PageInfo pi) {
		return noticeDao.searchNoticeList(sqlSession, map, pi);
	}

	@Override
	public List<Map<Integer, String>> selectNoticeCategory() {
		return noticeDao.selectNoticeCategory(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectImportantNotice() {
		return noticeDao.selectImportantNotice(sqlSession);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public int insertNotice(Notice n) {
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	public int updateNotice(Notice n) {
		return noticeDao.updateNotice(sqlSession, n);
	}

	@Override
	public int deleteNoticeList(List<Integer> noticeNo) {
		return noticeDao.deleteNoticeList(sqlSession, noticeNo);
	}
	
	
}
