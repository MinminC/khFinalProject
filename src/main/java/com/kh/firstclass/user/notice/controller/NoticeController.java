package com.kh.firstclass.user.notice.controller;

import static com.kh.firstclass.common.model.vo.PageInfo.getPageInfo;

import java.util.ArrayList;
import java.util.HashMap;

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
		System.out.println(list+"K"+pi);
		return "user/notice/noticeListView";
	}
	
	@RequestMapping("detail.no")
	public String selectNoticeOne(int noticeNo, Model model) {
		
		int result = noticeService.increaseCount(noticeNo);
		
		if(result>0) {
			Notice n = null;
			n = noticeService.selectNoticeOne(noticeNo);
			model.addAttribute("n", n);
			return "user/notice/noticeDetailView";
		}else {
			model.addAttribute("errorMsg", "조회에 실패했습니다");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("search.no")
	public String searchNoticeList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, String type, String keyword, Model model) {
		HashMap<String, String> map = new HashMap();
		map.put("type", type);
		map.put("keyword", keyword);
		
		int listCount = noticeService.countSearchNotice(map);
		int currentPage = pageNo;
		int pageLimit = 5;
		int boardLimit = 8;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.searchNoticeList(map, pi);
		
		if(list != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			return "user/notice/noticeListView";
		}else {
			model.addAttribute("errorMsg", "검색에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
}
