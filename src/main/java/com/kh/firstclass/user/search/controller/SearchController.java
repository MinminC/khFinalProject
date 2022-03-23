package com.kh.firstclass.user.search.controller;


import static com.kh.firstclass.common.model.vo.PageInfo.getPageInfo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.firstclass.admin.place.model.vo.AreaCode;
import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;
import com.kh.firstclass.user.search.model.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	private static final String SERVICE_KEY = "m%2BXQ6JZ8nOxT0%2B2ewkBZu5xzdEDAqebDxTFvI5yk%2BUl%2BNBdExNfOCji4u6PJkpZcGcujkx%2FLd26XQiHfFtraLw%3D%3D";
	
	@RequestMapping(value="search")
	public String searchListMain(@RequestParam(value="where", defaultValue="Main") String where
			, @RequestParam(value="keyword", defaultValue="") String keyword
			, @RequestParam(value="sort", defaultValue="new") String sort
			, @RequestParam(value="pageNo", defaultValue="1") int pageNo
			, Model model) {
		//키워드 없으면 그냥 반환함
		if(keyword.equals("")) {
			return "user/search/searchList"+where;
		}
		//where.equals("Main") -> 전부 조회해아함
		//where.equals("Place") -> Review 조회안함
		//where.equals("Review") -> Place 조회안함
		//무조건 조회해아하는것
		
		//ranking
		ArrayList<String> ranking = searchService.countSearchRanking();
		System.out.println(ranking);
		
		//키워드의 띄어쓰기를 모두 분리해서 검색 노출
		String[] keywords = keyword.split(" ");
		//WHERE가 MAIN일때만 검색어 테이블에 저장
		if(where.equals("Main"))
			searchService.insertKeyword(keywords);
		
		//keyword를 Map에 가공
		HashMap<String, Object> mapList = new HashMap<>();
		mapList.put("keywords", keywords);
		mapList.put("sort", sort);
		
		if(!where.equals("Review")) {
			//완전일치
			HashMap<String, String> mapOne = new HashMap<>();
			mapOne.put("keyword", keyword);
			mapOne.put("sort", sort);
			Place p = searchService.selectPlaceOne(mapOne);

			//페이징 처리
			int listCount = searchService.countPlace(mapList);
			int currentPage = pageNo;
			int pageLimit = 5;
			int boardLimit = 10;
			PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			//검색결과 조회
			ArrayList<Place> places = searchService.selectPlaceList(mapList, pi);
			System.out.println(places);
			
			model.addAttribute("places", places);
			model.addAttribute("p", p);
			model.addAttribute("pi", pi);
		}
		
		if(!where.equals("Place")) {
			int listCount = searchService.countReview(mapList);
			int currentPage = pageNo;
			int pageLimit = 5;
			int boardLimit = 10;
			PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			
			ArrayList<Review> reviews = searchService.selectReviewList(mapList, pi);
				
			ArrayList<Integer> reviewNo = new ArrayList<>();
			for(Review review:reviews)
				reviewNo.add(review.getPlaceNo());
			
			ArrayList<ReviewPicture> reviewPicture = searchService.selectPictureList(reviewNo);
			model.addAttribute("pi", pi);
			model.addAttribute("reviews", reviews);
			model.addAttribute("reviewPicture", reviewPicture);
		}
		
		model.addAttribute("where", where);
		model.addAttribute("keyword", keyword);
		model.addAttribute("ranking", ranking);
		
		return "user/search/searchList"+where;
	}
}
