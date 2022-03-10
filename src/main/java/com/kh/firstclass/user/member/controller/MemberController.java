package com.kh.firstclass.user.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.common.template.Pagination;
import com.kh.firstclass.user.member.model.service.MemberService;
import com.kh.firstclass.user.member.model.vo.Inquiry;
import com.kh.firstclass.user.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//로그인 화면으로 이동
	@RequestMapping("loginForm.me")
	public String loginMember() {
		return "user/member/loginMember";
	} 
	
	// 메인 페이지로 이동
	@RequestMapping("myPage.me")
	public String myPage() {
		return "user/member/myPage";
	}
	
	// 개인정보 변경 페이지로 이동
	@RequestMapping("update.me")
	public String updateMember() {
		// 암호화
		// 지금은 로그인 유저의 정보를 가져왔지만 암호화 작업 후에는 로그인한 유저의 아이디와 입력한 비밀번호를 통해 해당 유저의 정보를 뺏어오기
		
		
		return "user/member/updateMember";
	}
	
	// 개인정보 변경
	@RequestMapping("updateEnrollForm.me")
	public String updateEnrollForm(Member m, HttpSession session, Model model) {
		
		int result = memberService.updateEnrollForm(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수정 되었습니다.");
			return "redirect:update.me";
		} else { 
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		
	}
	
	// 비밀번호 변경 페이지로 이동
	@RequestMapping("update.pwd")
	public String updatePassword() {
		return "user/member/updatePassword";
	}
	
	//updateEnrollForm.pwd
	// 비밀번호 변경
	@RequestMapping("updateEnrollForm.pwd")
	public String updateEnrollForm(Member m) {
		// 암호화 해서 집어넣어야한다.
		return "user/member/updatePassword";
		
	}
	
	
	// 나의 일정 페이지로 이동
	@RequestMapping("mySchedule.me")
	public String mySchedule() {
		return "user/member/mySchedule";
	}

		//로그인
		@RequestMapping("login.me")
		public ModelAndView loginMember(Member m, ModelAndView mv,HttpSession session) {
			
			Member loginUser = memberService.loginMember(m);
			
			if(loginUser==null) { //로그인실패 =>에러문구를 requestScope에 담고 에러페이지로 포워딩
				
				mv.addObject("errorMsg","에러발생");
				mv.setViewName("common/errorPage");
				
				
			}else {//로그인 성공 => loginUser를 sessionScope에 담고 메인페이지 url로 재요청
				
				session.setAttribute("loginUser", loginUser);
				
				mv.setViewName("redirect:/");
			}
			
			return mv;
		}
		
		//회원가입화면으로 이동
		@RequestMapping("enrollForm.me")
		public String memberEnrollForm() {
			return "user/member/memberEnrollForm";
		}
		
		@RequestMapping("logout.me")
		public String logoutMember(HttpSession session) {//로그인 세션 만료시키기
			
			session.invalidate();
			
			return "redirect:/";
		}
	
 
	// 나의 리뷰 페이지로 이동
	@RequestMapping("myReview.me")
	public String myReview() {
		return "user/member/myReview";
	}
		
	// 문의 페이지로 이동
	@RequestMapping("myInquiry.me")
	public ModelAndView myInquiry(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
	
		int listCount = memberService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = PageInfo.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				
		ArrayList<Inquiry> list = memberService.selectList(pi);
		
		//model.addAttribute("list", list);
		//model.addAttribute("pi", pi);
		
		mv.addObject("list",list);
		mv.addObject("pi", pi);
		
		// 포워딩 (/WEB-INF/views/   board/boardListView    .jsp)
		mv.setViewName("user/member/myInquiry");
		
		return mv;
		
	}	
	
	// 문의하기 페이지로 이동
	@RequestMapping("enrollForm.bo")
	public String inquiryEnrollForm() {
		return "user/member/inquiryEnrollForm";
	}
	
	// 문의하기 
	@RequestMapping("insert.inq")
	public String insertBoard(Inquiry i, HttpSession session, Model model) {
		
		int result = memberService.insertInquiry(i);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문의 되었습니다.");
			return "redirect:myInquiry.me";
		} else { 
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		
	}
	
	// 문의 상세보기
	@RequestMapping("detail.inq")
	public ModelAndView selectInquiry(ModelAndView mv, int no) {
		
		Inquiry i = memberService.selectInquiry(no);
		mv.addObject("i",i).setViewName("user/member/inquiryDetailForm");
			
		return mv;
		
	}
	
	// 나의 문의 삭제
	@RequestMapping("delete.inq")
	public String deleteInquiry(int no, Model model, String filePath, HttpSession session) {

		int result = memberService.deleteInquiry(no);
		
		if(result > 0) {			
			session.setAttribute("alertMsg", "문의가 삭제되었습니다");
			return "redirect:myInquiry.me";
		} else {
			model.addAttribute("errorMsg", "문의 삭제가 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	// 나의 문의 수정
	@RequestMapping("update.inq")
	public String updateInquiry(Inquiry i, Model model, HttpSession session) {

		int result = memberService.updateInquiry(i);
		
		if(result > 0) {			
			session.setAttribute("alertMsg", "문의가 수정되었습니다");
			return "redirect:myInquiry.me";
		} else {
			model.addAttribute("errorMsg", "문의 수정을 실패했습니다.");
			return "common/errorPage";
		}
	}
	
}
