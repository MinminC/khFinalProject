package com.kh.firstclass.user.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.notice.model.vo.Notice;

public interface NoticeService {

	int countNoticeAll(int selectCategory);

	ArrayList<Notice> selectNoticeList(int selectCategory, PageInfo pi);

	Notice selectNoticeOne(int noticeNo);

	int increaseCount(int noticeNo);

	int countSearchNotice(HashMap<String, String> map);

	ArrayList<Notice> searchNoticeList(HashMap<String, String> map, PageInfo pi);

	List<Map<Integer, String>> selectNoticeCategory();

	ArrayList<Notice> selectImportantNotice();

	int deleteNotice(int noticeNo);

	int insertNotice(Notice n);

	int updateNotice(Notice n);

	int deleteNoticeList(List<Integer> noticeNo);

}
