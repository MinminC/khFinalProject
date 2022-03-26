package com.kh.firstclass.admin.place.controller;

import static com.kh.firstclass.common.model.vo.PageInfo.getPageInfo;
import static com.kh.firstclass.common.model.vo.SaveFile.changeName;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.firstclass.admin.place.model.service.PlaceService;
import com.kh.firstclass.admin.place.model.vo.AreaCode;
import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.admin.place.model.vo.PlaceType;
import com.kh.firstclass.common.model.vo.PageInfo;

@Controller
public class PlaceController {
	
	@Autowired
	private PlaceService placeService;
	
	private static final String SERVICE_KEY = "m%2BXQ6JZ8nOxT0%2B2ewkBZu5xzdEDAqebDxTFvI5yk%2BUl%2BNBdExNfOCji4u6PJkpZcGcujkx%2FLd26XQiHfFtraLw%3D%3D";
	
	@RequestMapping("list.pl")
	public String selectPlaceList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		
		int listCount = placeService.countPlaceAll();
		int currentPage = pageNo;
		int pageLimit = 5;
		int boardLimit = 8;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Place> list = placeService.selectPlaceList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/place/placeListView";
	}

	@RequestMapping("updateForm.pl")
	public String updatePlaceForm(int placeNo, Model model){
		Place p = placeService.selectPlaceDetail(placeNo);
		ArrayList<String> tags = new ArrayList<>();
		
		for(String str: p.getPlaceTags().split(","))
			tags.add(str);

		ArrayList<AreaCode> areaCode = placeService.selectAreaCode();
		ArrayList<PlaceType> placeType = placeService.selectPlaceType();
		
		model.addAttribute("areaCode", areaCode);
		model.addAttribute("placeType", placeType);
		model.addAttribute("tags", tags);
		model.addAttribute("p", p);
		model.addAttribute("placeNo", placeNo);
		
		return "admin/place/placeUpdateForm";
	}

	@RequestMapping("update.pl")
	public String updatePlace(Place p, MultipartFile upfile, Model model, HttpSession session){
		
		if(upfile != null && !upfile.getOriginalFilename().equals("")) {
			p.setPicOrigin(upfile.getOriginalFilename());
			p.setPicChange(changeName("place", upfile, session));
		}
		
		int result = placeService.updatePlace(p);
		
		if(result>0) {
			model.addAttribute("alertMsg", "수정성공");
			return "redirect:detail.pl?placeNo="+p.getPlaceNo();
		}else {
			model.addAttribute("alertMsg", "수정실패");
			return "common/errorPage";
		}
	}

	@RequestMapping("insertForm.pl")
	public String enrollPlaceForm(Model model) {
		//리퀘스트 영역에 담을 것
		ArrayList<AreaCode> areaCode = placeService.selectAreaCode();
		ArrayList<PlaceType> placeType = placeService.selectPlaceType();
		model.addAttribute("areaCode", areaCode);
		model.addAttribute("placeType", placeType);
		
		return "admin/place/placeInsertForm";
	}
	
	@RequestMapping("insert.pl")
	public String insertPlace(Place p, MultipartFile upfile, HttpSession session, Model model) {
		//파일이 존재한다면(존재함)
		
		if(!upfile.getOriginalFilename().equals("")) {
			p.setPicOrigin(upfile.getOriginalFilename());
			p.setPicChange(changeName("place", upfile, session));
		}
		
		//이미지를 서버에 저장 -> 링크 임베드 방식?

		return placeService.insertPlace(p) > 0?"redirect:list.pl":"common/errorPage";
	}
	
	/**
	 * 여행지 등록에서 키워드로 검색하여 오픈데이터를 추가하는 AJAX 처리 부분
	 * @param keyword 검색할 단어
	 * @param pageNo pagination의 페이지 번호
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="searchOpenData.pl", produces="text/xml; charset=UTF-8")
	public String searchOpenData(String keyword, @RequestParam(value="pageNo", defaultValue="1") int pageNo) throws IOException{
		
		//url 완성
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword";
		
		url += "?serviceKey="+SERVICE_KEY;
		url += "&MobileApp=AppTest";
		url += "&MobileOS=ETC";
		url += "&pageNo="+pageNo;
		url += "&numOfRows=5";
		url += "&listYN=Y";
		url += "&arrange=A";
		url += "&contentTypeId=12";
		url += "&keyword="+URLEncoder.encode(keyword, "UTF-8");
		
		//API에 요청하기
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		//통로 열기
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		while((line = br.readLine()) != null)
			responseText += line;
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}
	
	@RequestMapping("search.pl")
	public String searchPlaceList(String keyword, String type, @RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		HashMap<String, String> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		int listCount = placeService.countPlaceByKeyword(map);
		int currentPage = pageNo;
		int pageLimit = 5;
		int boardLimit = 8;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Place> list = placeService.searchPlaceList(map, pi);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "admin/place/placeListView";
	}
	
	@RequestMapping("delete.pl")
	public String deletePlace(int placeNo){
		return placeService.deletePlace(placeNo) > 0?"redirect:list.pl":"common/errorPage";
	}
	
	@RequestMapping("detail.pl")
	public String selectPlaceDetail(int placeNo, Model model) {
		Place p = placeService.selectPlaceDetail(placeNo);
		ArrayList<String> tags = new ArrayList<>();
		
		for(String str: p.getPlaceTags().split(","))
			tags.add(str);

		model.addAttribute("tags", tags);
		model.addAttribute("p", p);
		
		return p != null?"admin/place/placeDetailView":"common/errorPage";
	}
	
	@RequestMapping("top5.pl")
	public String selectPlace(String type, @RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		
		int listCount = placeService.countPlaceAll();
		int currentPage = pageNo;
		int pageLimit = 3;
		int boardLimit = 5;
		PageInfo pi = getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Place> list = placeService.selectPlaceList(pi);
		ArrayList<AreaCode> areaCode = placeService.selectAreaCode();
		ArrayList<PlaceType> placeType = placeService.selectPlaceType();
		
		model.addAttribute("list", list);
		model.addAttribute("areaCode", areaCode);
		model.addAttribute("placeType", placeType);
		
		return "user/place/placeListView";
	}
	
	@RequestMapping("main.pl")
	public String selectUserPlace(@RequestParam(value="pageNo", defaultValue="1") int pageNo, ArrayList<String> keywords, Model model) {
		
		ArrayList<AreaCode> areaCode = placeService.selectAreaCode();
		
		model.addAttribute("area", areaCode);
		
		return "user/place/placeListView";
	}
	
	@ResponseBody
	@RequestMapping(value="select.pl"/*, produces="application/json; charset=UTF-8"*/)
	//produces는 json배열로 넘길때는 오류 안나는데 json배열아닌 걸로 넘기면 오류남. 추후에 여러 태그 받게 되는 경우에는 남기기
	public ArrayList<Place> selectUserPlaceList(@RequestParam(value="tag", defaultValue="") String tag
			, @RequestParam(value="area", defaultValue="전체") String area, Model model) {
		HashMap<String, String> map = new HashMap<>();
		map.put("area", area);
		map.put("tag", tag);
		System.out.println(area+":"+tag);
		ArrayList<Place> list = placeService.selectUserPlaceList(map);
		System.out.println(list);
		
		return list;
	}
}
