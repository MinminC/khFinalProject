package com.kh.firstclass.user.place.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.firstclass.admin.place.model.service.PlaceService;
import com.kh.firstclass.admin.place.model.vo.Place;

@Controller
public class UserPlaceController {
	
	@Autowired
	private PlaceService placeService;
	
	private static final String SERVICE_KEY = "m%2BXQ6JZ8nOxT0%2B2ewkBZu5xzdEDAqebDxTFvI5yk%2BUl%2BNBdExNfOCji4u6PJkpZcGcujkx%2FLd26XQiHfFtraLw%3D%3D";
	
	@RequestMapping("detailView.pl")
	public ModelAndView placeDetailView(int placeNo, ModelAndView mv) {
		
		// 여행지 검색 시 카운터 +
		placeService.placeCount(placeNo);
		
		// 정보 긁어오기
		Place p = placeService.placeDetailView(placeNo);
		
		String tag = p.getPlaceTags();
		tag = tag.replace(",", "&nbsp;&nbsp; #");
		p.setPlaceTags("#"+tag);		
		
		mv.addObject("p",p);
		mv.setViewName("user/place/placeDetailView");
		
		return mv;
		
	}
	
}
