package com.kh.firstclass.user.search.controller;


import static com.kh.firstclass.common.model.vo.PageInfo.getPageInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;
import com.kh.firstclass.user.search.model.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value="search")
	public String searchListMain(@RequestParam(value="where", defaultValue="Main") String where
			, @RequestParam(value="keyword", defaultValue="") String keyword
			, @RequestParam(value="sort", defaultValue="new") String sort
			, @RequestParam(value="pageNo", defaultValue="1") int pageNo
			, Model model) {
		//무조건 해아하는것
		//키워드의 띄어쓰기를 모두 분리해서 검색 노출
		String[] keywords = keyword.split(" ");
		//WHERE가 MAIN일때만 검색어 테이블에 저장
		if(!keyword.equals("") && where.equals("Main"))
			searchService.insertKeyword(keywords);
		//검색 ranking
		ArrayList<String> ranking = searchService.countSearchRanking();
		model.addAttribute("where", where);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		model.addAttribute("ranking", ranking);
		
		//키워드가 있으면 조회
		if(!keyword.equals("")) {
			//where.equals("Main") -> 전부 조회해아함
			//where.equals("Place") -> Review 조회안함
			//where.equals("Review") -> Place 조회안함
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
				int pageLimit = 10;
				int boardLimit = 3;
				PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				//검색결과 조회
				ArrayList<Place> places = searchService.selectPlaceList(mapList, pi);
				
				model.addAttribute("places", places);
				model.addAttribute("p", p);
				model.addAttribute("pi", pi);
				model.addAttribute("totalPlace", listCount);
			}
			
			if(!where.equals("Place")) {
				int listCount = searchService.countReview(mapList);
				int currentPage = pageNo;
				int pageLimit = 10;
				int boardLimit = 3;
				PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				
				ArrayList<Review> reviews = searchService.selectReviewList(mapList, pi);
				
				model.addAttribute("reviews", reviews);
				model.addAttribute("pi", pi);
				model.addAttribute("totalReview", listCount);
				System.out.println(reviews);
			}
		}
		return "user/search/searchListMain";
	}
	
	@ResponseBody
	@RequestMapping("ajaxReviewImage.se")
	public ArrayList<ReviewPicture> selectReviewPicture(@RequestParam(value = "reviewsNum") List<Integer> reviewsNum){
		return searchService.selectReviewPicture(reviewsNum);
	}
}
