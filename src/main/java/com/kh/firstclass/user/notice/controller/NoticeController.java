package com.kh.firstclass.user.notice.controller;

import static com.kh.firstclass.common.model.vo.PageInfo.getPageInfo;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.notice.model.service.NoticeService;
import com.kh.firstclass.user.notice.model.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list.no")
	public String selectNoticeList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model){
		int listCount = noticeService.countNoticeAll();
		int currentPage = pageNo;
		int pageLimit = 5;
		int boardLimit = 8;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "user/notice/noticeListView";
	}
	
	@RequestMapping("search.no")
	public String searchNoticeList(String keyword) {
		
		return "user/notice/noticeListView";
	}
	
	@RequestMapping("detail.no")
	public String selectNoticeOne(int noticeNo) {
		//가져오기
		return "user/notice/noticeDetailView";
	}
}
