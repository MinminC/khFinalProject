package com.kh.firstclass.user.mainPage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.user.mainPage.model.service.MainPageService;
import com.kh.firstclass.user.notice.model.vo.Notice;


@Controller
public class MainPageController {

	@Autowired
	private MainPageService mainPageService ;
	
	@ResponseBody
	@RequestMapping(value="fixedNotice.mp",produces="application/json;charset=utf-8")
	public String selectFixedNotice() {//메인페이지에 공지사항
		
		ArrayList<Notice> list = mainPageService.selectFixedNotice();
		
		
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="bestPlace.mp",produces="application/json;charset=utf-8")
	public String bestPlace() {
		
		ArrayList<Place> list = mainPageService.selectBestPlace();
		
		
		return new Gson().toJson(list);
	}
	
}
