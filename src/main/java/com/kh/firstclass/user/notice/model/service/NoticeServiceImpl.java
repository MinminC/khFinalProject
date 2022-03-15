package com.kh.firstclass.user.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public int countNoticeAll() {
		return noticeDao.countNoticeAll(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return noticeDao.selectNoticeList(sqlSession, pi);
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
	
	
}
