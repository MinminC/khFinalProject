package com.kh.firstclass.user.schedule.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class scheduleController {
	
	@RequestMapping("detail.sc")
	public String detail() {
		return "user/schedule/scheduleHome";
	}
	
	
	@RequestMapping("main.sc")
	public String main() { 
		return "user/schedule/scheduleMain";
	}
	
	@RequestMapping(value="add.sc" ,method =RequestMethod.POST)
	public String add(HttpServletRequest request) throws ParseException {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		String scheduleTitle = request.getParameter("scheduleTitle");
		Date departureDate = simpleDateFormat.parse(request.getParameter("departureDate"));
		Date arrivalDate = simpleDateFormat.parse(request.getParameter("arrivalDate"));
		
		
		String newdepartureDate = simpleDateFormat.format(departureDate);
		String newarrivalDate = simpleDateFormat.format(arrivalDate);
		
		
		System.out.println(scheduleTitle + newdepartureDate + newarrivalDate);
		return "user/schedule/scheduleHome";
	}
	
	
	
}
