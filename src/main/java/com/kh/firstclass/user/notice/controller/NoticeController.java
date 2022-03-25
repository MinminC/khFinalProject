package com.kh.firstclass.user.notice.controller;

import static com.kh.firstclass.common.model.vo.PageInfo.getPageInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.notice.model.service.NoticeService;
import com.kh.firstclass.user.notice.model.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list.no")
	public String selectNoticeList(@RequestParam(value="pageNo", defaultValue="1") int pageNo
									,@RequestParam(value="category", defaultValue="0") int selectCategory, Model model){
		int listCount = noticeService.countNoticeAll(selectCategory);
		int currentPage = pageNo;
		int pageLimit = 5;
		int boardLimit = 8;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<Map<Integer, String>> category = noticeService.selectNoticeCategory();
		
		//중요 공지
		ArrayList<Notice> list = noticeService.selectImportantNotice();
		//일반 공지
		ArrayList<Notice> commons = noticeService.selectNoticeList(selectCategory, pi);
		//리스트 연결
		list.addAll(commons);
		
		model.addAttribute("category", category);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		if(selectCategory != 0)
			model.addAttribute("selectCategory", selectCategory);
		
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
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		int listCount = noticeService.countSearchNotice(map);
		int currentPage = pageNo;
		int pageLimit = 5;
		int boardLimit = 8;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Map<Integer, String>> category = noticeService.selectNoticeCategory();
		
		//중요공지
		ArrayList<Notice> list = noticeService.selectImportantNotice();
		//일반 공지
		ArrayList<Notice> commons = noticeService.searchNoticeList(map, pi);
		//리스트 연결
		list.addAll(commons);
		
		model.addAttribute("category", category);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "user/notice/noticeListView";
	}
	
	
	@RequestMapping("listAdmin.no")
	public String selectAdminNoticeList(@RequestParam(value="pageNo", defaultValue="1") int pageNo
										,@RequestParam(value="selectCategory", defaultValue="0") int selectCategory, Model model){
		int listCount = noticeService.countNoticeAll(selectCategory);
		int currentPage = pageNo;
		int pageLimit = 5;
		int boardLimit = 8;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(selectCategory, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		System.out.println(list+"K"+pi);
		
		if(selectCategory != 0)
			model.addAttribute("selectCategory", selectCategory);
		
		return "admin/notice/noticeListView";
	}
	
	@RequestMapping("detailAdmin.no")
	public String selectAdminNoticeOne(int noticeNo, Model model) {
		
		int result = noticeService.increaseCount(noticeNo);
		
		if(result>0) {
			Notice n = null;
			n = noticeService.selectNoticeOne(noticeNo);
			model.addAttribute("n", n);
			return "admin/notice/noticeDetailView";
		}else {
			model.addAttribute("errorMsg", "조회에 실패했습니다");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("searchAdmin.no")
	public String searchAdminNoticeList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, String type, String keyword, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		int listCount = noticeService.countSearchNotice(map);
		int currentPage = pageNo;
		int pageLimit = 5;
		int boardLimit = 8;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.searchNoticeList(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "admin/notice/noticeListView";
	}
	
	@RequestMapping("insertForm.no")
	public String insertForm(Model model) {
		List<Map<Integer, String>> category = noticeService.selectNoticeCategory();
		
		model.addAttribute("category", category);
		
		return "admin/notice/noticeInsertForm";
	}
	
	@RequestMapping("insert.no")
	public String insertNotice(Notice n) {
		int result = noticeService.insertNotice(n);
		return "redirect:listAdmin.no";
	}
	
	@RequestMapping("updateForm.no")
	public String updateForm(int noticeNo, Model model) {
		List<Map<Integer, String>> category = noticeService.selectNoticeCategory();
		
		Notice n = noticeService.selectNoticeOne(noticeNo);		
		
		model.addAttribute("category", category);
		model.addAttribute("n", n);
		
		return "admin/notice/noticeUpdateForm";
	}
	
	@RequestMapping("update.no")
	public String updateNotice(Notice n) {
		int result = noticeService.updateNotice(n);
		return "redirect:detailAdmin.no?noticeNo="+n.getNoticeNo();
	}
	
	@GetMapping("delete.no")
	public String deleteNotice(int noticeNo, Model model) {
		int result = noticeService.deleteNotice(noticeNo);
		if(result > 0) {
			model.addAttribute("AlertMsg", "삭제 성공");
			return "redirect:listAdmin.no";
		}else {
			model.addAttribute("errorMsg", "삭제 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@PostMapping(value="delete.no")
	public int deleteNotice(@RequestParam(value="noticeNo")List<Integer> noticeNo, Model model) {
		System.out.println(noticeNo);
		return noticeService.deleteNoticeList(noticeNo);
	}
	
	@ResponseBody
	@RequestMapping("hideImportant")
	public void hideImportant(HttpServletResponse response) {
		Cookie ck = new Cookie("hideImportantNotice", "hideImportantNotice");
		ck.setMaxAge(60);//초단위
		response.addCookie(ck);
	}
	
	@ResponseBody
	@RequestMapping("openImportant")
	public void openImportant(HttpServletResponse response) {
		Cookie ck = new Cookie("hideImportantNotice", "hideImportantNotice");
		ck.setMaxAge(0);
		response.addCookie(ck);
	}
}
