package com.kh.firstclass.user.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.notice.model.dao.NoticeDao;
import com.kh.firstclass.user.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int countNoticeAll() {
		return 0;
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return null;
	}
	
	//공지사항 리스트 조회
	
	//공지사항 하나 조회
	
	
}
