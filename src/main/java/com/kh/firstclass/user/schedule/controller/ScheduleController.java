package com.kh.firstclass.user.schedule.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.firstclass.user.schedule.model.vo.AddSchedule;


@Controller
public class ScheduleController {
	
	@RequestMapping("detail.sc")
	public String detail() {
		return "user/schedule/scheduleHome";
	}
	
	
	@RequestMapping("main.sc")
	public String main() { 
		return "user/schedule/scheduleMain";
	}
	
	@RequestMapping(value="add.sc" ,method =RequestMethod.POST)
	public String add(AddSchedule addschedule) throws ParseException {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		
		Date departureDate = simpleDateFormat.parse(addschedule.getDepartureDate());
		Date arrivalDate = simpleDateFormat.parse(addschedule.getArrivalDate());
		
		
		String newdepartureDate = simpleDateFormat.format(departureDate);
		String newarrivalDate = simpleDateFormat.format(arrivalDate);
		
		addschedule.setArrivalDate(newarrivalDate);
		addschedule.setDepartureDate(newdepartureDate);
		
		
		
		System.out.println(addschedule);
		
		
	
		return "user/schedule/scheduleHome";
	}
	
	
	
}
