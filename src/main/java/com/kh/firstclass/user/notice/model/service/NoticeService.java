package com.kh.firstclass.user.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.notice.model.vo.Notice;

public interface NoticeService {

	int countNoticeAll();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

	Notice selectNoticeOne(int noticeNo);

	int increaseCount(int noticeNo);

	int countSearchNotice(HashMap<String, String> map);

	ArrayList<Notice> searchNoticeList(HashMap<String, String> map, PageInfo pi);
}
