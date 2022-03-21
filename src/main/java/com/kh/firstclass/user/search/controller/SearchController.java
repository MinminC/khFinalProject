package com.kh.firstclass.user.search.controller;


import static com.kh.firstclass.common.model.vo.PageInfo.getPageInfo;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;
import com.kh.firstclass.user.search.model.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("search")
	public String searchListMain(@RequestParam(value="where", defaultValue="Main") String where
			, @RequestParam(value="keyword", defaultValue="") String keyword
			, @RequestParam(value="sort", defaultValue="new") String sort
			, @RequestParam(value="pageNo", defaultValue="1") int pageNo
			, Model model) {
		//받아와야하는 정보
		//place의 경우 : 완전일치 1개
		//place 목록들
		HashMap<String, String> map = new HashMap<>();
		map.put("where", where);
		map.put("keyword", keyword);
		map.put("sort", sort);
		
		int listCount = searchService.countResult(map);
		int currentPage = pageNo;
		int pageLimit = 5;
		int boardLimit = 10;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		//완전일치
		Place p = searchService.selectPlaceOne(map, pi);
		System.out.println(listCount);
		
		//내용에서 비슷한게 있는지
		ArrayList<Place> places = searchService.searchPlaceList(map, pi);
//		ArrayList<Review> reviews = searchService.searchReviewList(map, pi);
		
//		ArrayList<Integer> reviewNo = new ArrayList<>();
//		for(Review review:reviews)
//			reviewNo.add(review.getPlaceNo());
		
//		ArrayList<ReviewPicture> reviewPicture = searchService.selectPictureList(reviewNo);
		
		model.addAttribute("where", where);
		model.addAttribute("keyword", keyword);

		model.addAttribute("p", p);
		model.addAttribute("pi", pi);
		model.addAttribute("places", places);
//		model.addAttribute("reviews", reviews);
//		model.addAttribute("reviewPicture", reviewPicture);
		
		return "user/search/searchList"+where;
	}
	
}
