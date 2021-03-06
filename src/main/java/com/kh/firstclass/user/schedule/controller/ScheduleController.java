package com.kh.firstclass.user.schedule.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.firstclass.user.member.model.service.MemberService;
import com.kh.firstclass.user.member.model.vo.Member;
import com.kh.firstclass.user.schedule.model.service.ScheduleService;
import com.kh.firstclass.user.schedule.model.vo.AccountBook;
import com.kh.firstclass.user.schedule.model.vo.AddSchedule;
import com.kh.firstclass.user.schedule.model.vo.DetailSchedule;
import com.kh.firstclass.user.schedule.model.vo.SimpleSchedule;
import com.kh.firstclass.user.schedule.model.vo.chatLog;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;

	@Autowired
	private MemberService memberService;

	@RequestMapping("detail.sc")
	public String detail() {
		return "user/schedule/scheduleDetail";
	}

	@RequestMapping("main.sc")
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		ArrayList<String> monoList = m.getMoNo();
		ArrayList<SimpleSchedule> list = new ArrayList<SimpleSchedule>();
		for(int i =0;i<monoList.size();i++) {
			SimpleSchedule simpleSchedule = scheduleService.selectScheduleTitle(monoList.get(i));
			list.add(simpleSchedule);
		}
		mv.addObject("list",list);
		mv.addObject("m", m);
		mv.setViewName("user/schedule/scheduleMain");

		return mv;
	}

	@RequestMapping(value = "add.sc", method = RequestMethod.POST)
	public ModelAndView add(AddSchedule addschedule, ModelAndView mv, HttpServletRequest request)
			throws ParseException {
		int moNo;
		do {
			moNo = (int) (Math.random() * 99999) + 1;
		} while (moNo < 9999);

		addschedule.setMoNo(moNo);

		int result = scheduleService.createSchedule(addschedule);

		Member m = (Member)(request.getSession().getAttribute("loginUser"));
		m.setMoNo(Integer.toString(moNo));
		// =========================????????? ?????? ????????? ????????? ???????????? ???????????? ??????
		// =========================??? ???????????? ?????? DB??? ????????? ??????????????? ???????????????.

		Member nm = memberService.loginMember(m);
		nm.setMoNo(Integer.toString(moNo));
		if (!nm.getMoNo().isEmpty()) {
			String premono = "";

			for (int i = 0; i < nm.getMoNo().size(); i++) {
				premono += nm.getMoNo().get(i);
			}
			HashMap<String, Object> map = new HashMap<>();
			map.put("moNo", premono);
			map.put("addId", m.getUserId());
			

			scheduleService.updateScheduleMember(map);

		} else {
			HashMap<String, Object> map = new HashMap<>();
			map.put("moNo", Integer.toString(moNo) );
			map.put("addId", m.getUserId());
			scheduleService.updateScheduleMember(map);
		}

		if (result > 0) {
			mv.addObject("moNo", moNo);

			mv.setViewName("user/schedule/scheduleDetail");
			return mv;
		} else {
			mv.addObject("alertMsg", "??????????????? ??????????????????.");
			mv.setViewName("redirect:/");
			return mv;

		}

	}

	@RequestMapping("addmember.sc")
	public ModelAndView addMember(ModelAndView mv, HttpServletRequest request, HttpSession session, String mono,
			String addId) {

		Member m = new Member();
		m.setUserId(addId);

		// ?????? ?????? ???????????? ?????????????????????.
		Member nm = memberService.loginMember(m);
		// ??????????????? ????????????

		if (!nm.getMoNo().isEmpty()) {
			nm.setMoNo(mono);

			// ??????????????? ????????? ???????????? ?????? ????????? ??????????????? ???????????? ?????? ????????? update?????????
			String premono = "";
			for (int i = 0; i < nm.getMoNo().size(); i++) {
				premono += nm.getMoNo().get(i);
			}

			HashMap<String, Object> map = new HashMap<>();
			map.put("moNo", premono);
			map.put("addId", addId);

			int result = scheduleService.updateScheduleMember(map);
			session.setAttribute("alertMsg", "??????????????????");

			mv.addObject("moNo", mono);

			mv.setViewName("user/schedule/scheduleDetail");
			return mv;

			// ??????????????? ?????? ????????? ??????????????? ????????? ???????????? ?????? ??????
		} else {
			HashMap<String, Object> map = new HashMap<>();
			map.put("moNo", mono );
			map.put("addId", addId);

			int result = scheduleService.updateScheduleMember(map);
			session.setAttribute("alertMsg", "??????????????????");

			mv.addObject("moNo", mono);

			mv.setViewName("user/schedule/scheduleDetail");
			return mv;

		}
	}

	@RequestMapping("scheduleDetail.sc")
	public ModelAndView detailView(ModelAndView mv, String moNo) {

		mv.addObject("moNo", moNo);
		mv.setViewName("user/schedule/scheduleDetail");
		return mv;
	}

	@ResponseBody
	@RequestMapping("sendMsg.ajax")
	public String sendMsg(@RequestParam("newmsg") String newmsg, @RequestParam("mono") String mono) {

		HashMap<String, Object> map = new HashMap<>();

		map.put("mono", mono);
		map.put("newmsg", newmsg);
		int result = scheduleService.insertSendMassage(map);

		return "";
	}

	@ResponseBody
	@RequestMapping("receiveMsg.ajax")
	public List<chatLog> receiveMsg(@RequestParam("mono") String mono) {

		List<chatLog> list = scheduleService.selectReceiveMsg(mono);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("selectMember.sc")
	public List<String> selectMember(@RequestParam("moNo") String mono){
		List<String> list = scheduleService.selectMember(mono);
		
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("selectTime.sc")
	public List<String> selectTime(@RequestParam("moNo") String mono){
		List<String> list = scheduleService.selectTime(mono);
		
		return list;
	}
	
	@RequestMapping("addDetailSchedule.sc")
	public ModelAndView addDetailSchedule(DetailSchedule schedule,ModelAndView mv) {
		int result = scheduleService.addDetailSchedule(schedule);
		String mono = schedule.getMo_no();
		mv.addObject("moNo",mono);
		mv.setViewName("user/schedule/scheduleDetail");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("selectAccount.ajax")
	public List<AccountBook> selectAccount(String mono){
		List<AccountBook> list = new ArrayList<AccountBook>();
		list = scheduleService.selectAccount(mono);
		
		return list;
	}
	@RequestMapping("addAccount.sc")
	public ModelAndView addAccount(AccountBook accountBook,ModelAndView mv) {
		
		int result = scheduleService.addAccount(accountBook);
		String mono = accountBook.getMo_no();
		mv.addObject("moNo",mono);
		mv.setViewName("user/schedule/scheduleDetail");
		
		return mv;
	}
	@ResponseBody
	@RequestMapping("selectAddress.sc")
	public List<HashMap> selectAddress(@RequestParam("moNo") String moNo){
		List<HashMap> list = new ArrayList<HashMap>();
		
		list = scheduleService.selectAddress(moNo);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
