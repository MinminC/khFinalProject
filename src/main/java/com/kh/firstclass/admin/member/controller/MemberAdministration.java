package com.kh.firstclass.admin.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.firstclass.admin.member.model.service.MemberAdminService;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.common.template.Pagination;
import com.kh.firstclass.user.member.model.vo.Member;
@Controller
public class MemberAdministration {

	@Autowired
	private MemberAdminService memberAdminService;
	
	//회원관리화면으로 이동 
	@RequestMapping("admin.me")
	public String selectMember(@RequestParam(value="cpage",defaultValue="1")int currentPage,Model model) {
		
		
		int listCount = memberAdminService.selectMemberCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Member> list = memberAdminService.selectMember(pi);
		
		model.addAttribute("listCount",listCount);
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		
		return "admin/member/memberController";
	} 
	
	@ResponseBody
	@RequestMapping("delete.me")
	public int adminDeleteMember(/*String[]checkboxArr,*/HttpServletRequest request) {
		
		String[] checkboxArr = request.getParameterValues("checkboxArr"); 
		
		ArrayList list = new ArrayList();
		
		for(int i=0; i<checkboxArr.length; i++) {
			
			list.add(checkboxArr[i]);
			
		}
	
		int result = memberAdminService.adminDeleteMember(list);
			
		return result;
	}
	
	@RequestMapping("search.me")
	public String adminSearchMember(String condition,String keyword,int currentPage,Model model) {//id,name 밸류 / 사용자가 입력한값
		
		
		HashMap<String,String>map = new HashMap<>();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		memberAdminService.selectSearchCount(map);
		
		int searchCount = memberAdminService.selectSearchCount(map); //현재 검색결과에 맞는 게시글의 총 갯수
		
		PageInfo pi = Pagination.getPageInfo( searchCount, currentPage, 5, 10);
		int listCount = memberAdminService.selectMemberCount();
		
		ArrayList<Member>selectList=memberAdminService.adminSearchMember(pi,map);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", selectList);
		model.addAttribute("keyword",keyword);
		model.addAttribute("searchCount",searchCount);
		model.addAttribute("listCount",listCount);
		model.addAttribute("condition", condition);
		
		
		return "admin/member/memberController";
	}
	

	
}
