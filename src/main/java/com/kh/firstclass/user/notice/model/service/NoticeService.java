package com.kh.firstclass.user.notice.model.service;

import java.util.ArrayList;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.notice.model.vo.Notice;

public interface NoticeService {

	int countNoticeAll();

	ArrayList<Notice> selectNoticeList(PageInfo pi);
}
