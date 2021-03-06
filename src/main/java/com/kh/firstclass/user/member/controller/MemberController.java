package com.kh.firstclass.user.member.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.firstclass.common.mail.CertVo;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.service.MemberService;
import com.kh.firstclass.user.member.model.service.MemberServiceImpl;
import com.kh.firstclass.user.member.model.vo.Inquiry;
import com.kh.firstclass.user.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; //암호화작업
	
	@Autowired
	private JavaMailSender sender; //메일
	
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
	@ResponseBody
	@RequestMapping("update.me")
	public ModelAndView updateMember(ModelAndView mv, HttpSession session, Member m) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(m.getUserPwd() != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {			
			mv.setViewName("user/member/updateMember");
		}
		return mv;
	}
	
	// 개인정보 변경
	@RequestMapping("updateEnrollForm.me")
	public String updateEnrollForm(Member m, HttpSession session, Model model) {
		System.out.println("1");
		int result = memberService.updateEnrollForm(m);
		
		if(result > 0) {
			Member updateMem = memberService.loginMember(m);
			session.setAttribute("loginUser", updateMem);			
			session.setAttribute("alertMsg", "수정 되었습니다.");
			return "redirect:myPage.me";
		} else { 
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		
	}	
	
	//updateEnrollForm.pwd
	// 비밀번호 변경
	@RequestMapping("updateEnrollForm.pwd")
	public String updatePassword(Member m, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd()); 
		
		m.setUserPwd(encPwd);
		m.setUserNo(loginUser.getUserNo());
		
		int result = memberService.updatePassword(m);
		if(result != 0) {
			session.setAttribute("alertMsg", "비밀번호가 변경되었습니다. 재로그인 바랍니다.");
			session.removeAttribute("loginUser");
		}
		return "redirect:/";
		
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
	      
	      //평문과 암호화된 구문이 일치하면 true반환

	      if(loginUser!=null&&bcryptPasswordEncoder.matches(m.getUserPwd(),loginUser.getUserPwd())) {         

	         //로그인성공 

	         session.setAttribute("loginUser", loginUser);
	         mv.setViewName("redirect:/");
	         
	      }else { //로그인실패
	         //mv.addObject("errorMsg","로그인실패").setViewName("common/errorPage");
	         session.setAttribute("alertMsg", "로그인정보를확인해주세요");
	         mv.setViewName("redirect:/");
	         
	      
	      }
	      
	      return mv;
	   }

		
		//회원가입화면으로 이동
		@RequestMapping("enrollForm.me")
		public String memberEnrollForm() {
			return "user/member/memberEnrollForm";
		}
		
		@RequestMapping("insert.me")
		public String insertMember(Member m,Model model,HttpSession session){
			
		//암호화 작업(암호문을 만들어내는 과정)
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd()); 
		
		m.setUserPwd(encPwd);//Member객체에 userPwd에 평문이 들어가있으니 평문이 아닌 암호문으로 변경
		
		int result = memberService.insertMember(m);
		
			if(result>0) {//성공=>메인페이지url재요청
				
				session.setAttribute("alertMsg", "회원가입완료");
				
				return "redirect:/";
			}else {//실패=>에러문구를 담아서 에러페이지로 포워딩
				model.addAttribute("errorMsg","회원가입실패");
				return "common/errorPage";
			}
			
		}
		
		
		@RequestMapping("logout.me")
		public String logoutMember(HttpSession session) {//로그인 세션 만료시키기
			
			session.invalidate();
			
			return "redirect:/";
		}
		
		@ResponseBody
		@RequestMapping("idCheck.me")
		public String idCheck(String checkId) {
			
			int count = memberService.idCheck(checkId);
			
			return memberService.idCheck(checkId)>0?"NNNN":"NNNY";
		}
		
		@ResponseBody//리스폰스바디 없으면 접두어 접미사? 설정해놓은게 받아감
		@RequestMapping("sendMail.me")
		public int sendMail(String email,HttpServletRequest request) throws MessagingException {

			String ip = request.getRemoteAddr(); //ip알려주는 메소드 
			
			String secret = memberService.sendMail(ip); //인증번호db에 insert해와줌
			
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setTo(email);
			helper.setSubject("메일인증");
			helper.setText("인증번호:"+ secret);
			
			sender.send(message);
			
			return secret!=""?1:0;
		}
		
		// 개인정보변경(변경 이메일 확인)
		@ResponseBody
		@RequestMapping("sendEmail.me")
		public String sendEmail(String email,HttpServletRequest request) throws MessagingException {

			String ip = request.getRemoteAddr(); 
			String secret = memberService.sendMail(ip);
			
			MimeMessage message = sender.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setTo(email);
			helper.setSubject("메일인증");
			helper.setText("인증번호 : "+ secret);
			
			sender.send(message);
			
			return secret;
		}
		
		
		@ResponseBody
		@RequestMapping("check")
		public boolean check(String secret, HttpServletRequest request) {
			
			boolean result = memberService.validate(CertVo.builder()
											.who(request.getRemoteAddr())
											.secret(secret)
											.build());
			
			return result;
		}
		
		//비밀번호찾기
		@RequestMapping("searchPwd.me")
		public ModelAndView searchPwd(Member m, ModelAndView mv,HttpServletRequest request) throws MessagingException {
			
			int count = memberService.searchPwd(m);
		
		if(count>0) { //비밀번호 찾기 일치하는 정보가 있으면 
			
			String temporary = new MemberServiceImpl().generateSecret(); //임시비밀번호
			
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setTo(m.getEmail());
			helper.setSubject("임시비밀번호발급");
			helper.setText("임시비밀번호:"+ temporary);
			
			sender.send(message); //임시비밀번호 메일발송
			
			String encPwd = bcryptPasswordEncoder.encode(temporary);//임시비밀번호 암호화
			
			HashMap<String,Object> map= new HashMap<>();
			map.put("m", m);
			map.put("encPwd", encPwd);
			
			int result = memberService.updatePwd(map);
			
			if(result>0){
			
			request.setAttribute("alertMsg", "임시비밀번호전송완료");
			mv.setViewName("user/member/loginMember");
			
			}else {
				System.out.println("임시비밀번호발급실패");
			}
			
		}else { //비밀번호찾기 정보가 일치하지않으면
			
			request.setAttribute("alertMsg", "정보가일치하지않습니다");
			mv.setViewName("user/member/loginMember");
		}
		
			return mv;
		}
		
	
	//아이디찾기
	
	@RequestMapping("searchId.me")
	public ModelAndView SearchId(Member m, HttpServletRequest request,ModelAndView mv) {
		
		String searchId = memberService.searchId(m); //마스킹된 아이디 받아옴
		
		if(searchId!=null) {
			request.setAttribute("alertMsg","회원님의아이디는"+searchId+"입니다");
			
			mv.setViewName("user/member/loginMember");
			
		}else {
			
			request.setAttribute("alertMsg","해당정보로 조회되는 아이디가 없습니다");
			
			mv.setViewName("user/member/loginMember");
		}
		
		
		return mv;
	}
		
 
	// 나의 리뷰 페이지로 이동
	@RequestMapping("myReview.me")
	public String myReview() {
		return "user/member/myReview";
	}
		
	// 나의 문의 페이지로 이동
	@RequestMapping("myInquiry.me")
	public ModelAndView Inquiry(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
	
		Member m = (Member)session.getAttribute("loginUser");
		int listCount = memberService.inquiryListCount(m.getUserNo());
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = PageInfo.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				
		ArrayList<Inquiry> list = memberService.inquiryList(pi, m.getUserNo());
		
		mv.addObject("list",list);
		mv.addObject("pi", pi);
		
		mv.setViewName("user/member/myInquiry");
		
		return mv;
		
	}	
	
	// 문의 페이지로 이동(관리자)
		@RequestMapping("inquiry.ad")
		public ModelAndView myInquiry(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
			int listCount = memberService.selectListCount();
			
			int pageLimit = 10;
			int boardLimit = 5;
			
			PageInfo pi = PageInfo.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
					
			ArrayList<Inquiry> list = memberService.selectList(pi);
			
			mv.addObject("list",list);
			mv.addObject("pi", pi);
			
			mv.setViewName("admin/member/inquiry");
			
			return mv;
			
		}	
	
	// 문의 상세 페이지로 이동
	@RequestMapping("enrollForm.bo")
	public String inquiryEnrollForm() {
		return "user/member/inquiryEnrollForm";
	}	

	
	// 관리자 문의 상세 페이지
	@RequestMapping("inquiryDetail.ad")
	public ModelAndView inquiryDetail(ModelAndView mv, int no) {
			
		Inquiry i = memberService.selectInquiry(no);
		mv.addObject("i",i).setViewName("admin/member/inquiryDetailForm");
				
		return mv;
			
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
	
	// 관리자 문의 삭제
		@RequestMapping("deleteInquiry.ad")
		public String adminDeleteInquiry(int no, Model model, String filePath, HttpSession session) {

			int result = memberService.deleteInquiry(no);
			
			if(result > 0) {			
				session.setAttribute("alertMsg", "문의가 삭제되었습니다");
				return "redirect:inquiry.ad";
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
	
	// 문의 댓글(관리자)
	@ResponseBody
	@RequestMapping("registReply.ad")
	public int registReply(Inquiry i) {
		int result = memberService.registReply(i);
		
		return result;
	}
	
	// 회원 탈퇴
	@RequestMapping("delete.mem")
	public String deleteMember(Member m, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(bcryptPasswordEncoder.matches(m.getUserPwd(),loginUser.getUserPwd())) {			
			memberService.deleteMember(loginUser.getUserNo());
			session.invalidate();
		}
		return "redirect:/";
	}
	

	// 비밀번호 변경(본인확인 후 변경 페이지로 이동)
	@ResponseBody
	@RequestMapping("update.pwd")
	public ModelAndView updatePassword(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(bcryptPasswordEncoder.matches(m.getUserPwd(),loginUser.getUserPwd())) {		
			mv.setViewName("user/member/updatePassword");
		}
		
		return mv;
	}
	

}
