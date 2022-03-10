package com.kh.firstclass.user.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class scheduleController {
	
	@RequestMapping("main.sc")
	public String main() {
		return "user/schedule/scheduleHome";
	}
	
	
	
	
}
