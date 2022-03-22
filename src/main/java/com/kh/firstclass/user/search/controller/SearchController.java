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
	
	
	public static void main(String[] args)  throws IOException{
//	/**
//	 * 여행지 등록에서 키워드로 검색하여 오픈데이터를 추가하는 AJAX 처리 부분
//	 * @param keyword 검색할 단어
//	 * @param pageNo pagination의 페이지 번호
//	 * @return
//	 * @throws IOException
//	 */
//	@ResponseBody
//	@RequestMapping(value="weather", produces="application/json; charset=UTF-8")
//	public String findWeather() throws IOException{
//		HashMap<String, Object> map = new HashMap<>();
		ArrayList<AreaCode> area = new ArrayList<>();
		area.add(new AreaCode("서울", 60, 127));
		area.add(new AreaCode("서울", 60, 127));
		area.add(new AreaCode("인천", 55, 124));
		area.add(new AreaCode("경기", 60, 121));
		area.add(new AreaCode("강원", 92, 131));
		area.add(new AreaCode("충북", 69, 106));
		area.add(new AreaCode("충남", 68, 100));
		area.add(new AreaCode("경북", 90, 77));
		area.add(new AreaCode("경남", 91, 106));
		area.add(new AreaCode("전북", 63, 89));
		area.add(new AreaCode("전남", 50, 67));
		area.add(new AreaCode("제주", 52, 38));
		//시간 남으면 테이블에 저장하기
		
		//url 완성
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		url += "?serviceKey="+SERVICE_KEY;
		url += "&pageNo=1&numOfRows=1000&dataType=json";
		Date today = new Date();
		Date yesterday = new Date(today.getTime()+(1000*60*60*24*-1));
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HHmmss");
		
		if(Integer.parseInt(timeFormat.format(today))>50000)
			url += "&base_date="+dayFormat.format(today);
		else	
			url += "&base_date="+dayFormat.format(yesterday);
		
		url += "&base_time=0500";
		url += "&nx="+area.get(0).getLon();
		url += "&ny="+area.get(0).getLat();
		
		//API에 요청하기
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		//통로 열기
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		//받기
		String line = br.readLine();
		br.close();
		urlConnection.disconnect();
		//제공할 데이터의 형식
		//(구름)지역이름 최저/최고 습도
//		return responseText;
		//서올의 기상 상태 받아오는 건 했음
		//남은 일 -> 해당 자료를 기반으로 정보를 골라내서 가공+전체 지역에서도 조회+테이블에 지역정보 정리할지(lon, lat)
//		하늘상태 SKY
//		최저/최고 TMN/TMX
//		습도 REH
//		5:00에 자료 수집하고
//		5:10분에 API 갱신됨
//
//		하늘 상태	전운량
//		맑은	0~5
//		구름많음	6~8
//		흐림	9~10
		System.out.println(line);
	}
}
