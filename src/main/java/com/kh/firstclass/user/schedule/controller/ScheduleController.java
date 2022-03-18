package com.kh.firstclass.user.schedule.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.firstclass.user.member.model.vo.Member;
import com.kh.firstclass.user.schedule.model.service.ScheduleService;
import com.kh.firstclass.user.schedule.model.vo.AddSchedule;


@Controller
public class ScheduleController {
	
	  
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping("detail.sc")
	public String detail() {
		return "user/schedule/scheduleDetail";
	}
	
	
	@RequestMapping("main.sc")
	public ModelAndView main(ModelAndView mv,HttpSession session) { 
		Member m = (Member)session.getAttribute("loginUser");
		System.out.println("여기들어오세요?");
	
		mv.addObject("m",m);
		mv.setViewName("user/schedule/scheduleMain");
		
		
		return mv;
	}
	
	@RequestMapping(value="add.sc" ,method =RequestMethod.POST)
	public ModelAndView add(AddSchedule addschedule,ModelAndView mv) throws ParseException {
				
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		
//		Date departureDate = simpleDateFormat.parse(addschedule.getDepartureDate());
//		Date arrivalDate = simpleDateFormat.parse(addschedule.getArrivalDate());
//		
//		
//		String newdepartureDate = simpleDateFormat.format(departureDate);
//		String newarrivalDate = simpleDateFormat.format(arrivalDate);
//		String newdepartureDate = simpleDateFormat.format(addschedule.getDepartureDate());
//		String newarrivalDate = simpleDateFormat.format(addschedule.getArrivalDate());
//		
//		addschedule.setArrivalDate(newarrivalDate);
//		addschedule.setDepartureDate(newdepartureDate);
		
//		애초에 스프링이 VO모델로 가공할때 필드부의 자료형인 String으로 맞춰줌 >> 혹은 input:date 타입의 반환이 String ? 
		
		
		int moNo = (int)(Math.random()*99999)+1;
		addschedule.setMoNo(moNo);
		
		int result = scheduleService.createSchedule(addschedule);
		
		if(result > 0) {
			mv.addObject("moNo",moNo);
			mv.setViewName("user/schedule/scheduleDetail");
			return mv;
		}else {
			mv.addObject("alertMsg","모임생성의 실패했습니다.");
			mv.setViewName("redirect:/");
			return mv;
			
		}
		
	}
	@RequestMapping("addmember.sc")
	public ModelAndView addMember(ModelAndView mv,ServletRequest request,HttpSession session) {
		String moNo = (String)request.getAttribute("moNo"); //해당 모임
		Member m = (Member)session.getAttribute("loginUser"); //세션의 멤버 정보
		m.setMoNo(moNo);
		
		changeMoNo(m.getMoNo());
		//int resulet = scheduleService.addScheduleMember(m);
		
		mv.setViewName("redirect:user/schedule/scheduleDetail");
		return mv;
		
	}
	public String changeMoNo(ArrayList<String> arrayList) {
		String newmoNo = arrayList.toString();
		System.out.println(newmoNo);
		
		return newmoNo;
		
		
	}
	
	
	
}
