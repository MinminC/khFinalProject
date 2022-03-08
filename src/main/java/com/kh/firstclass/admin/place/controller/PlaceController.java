package com.kh.firstclass.admin.place.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

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

import static com.kh.firstclass.common.model.vo.SaveFile.*;

@Controller
public class PlaceController {
	
	@Autowired
	private PlaceService placeService;
	
	private static final String SERVICE_KEY = "m%2BXQ6JZ8nOxT0%2B2ewkBZu5xzdEDAqebDxTFvI5yk%2BUl%2BNBdExNfOCji4u6PJkpZcGcujkx%2FLd26XQiHfFtraLw%3D%3D";
	
	@RequestMapping("list.pl")
	public String selectPlaceList() {
		return "admin/place/placeListView";
	}
	
	@RequestMapping("detail.pl")
	public String selectPlaceDetail(){
		return "admin/place/placeDetailView";
	}

	@RequestMapping("updateForm.pl")
	public String updatePlaceForm(int pno, Model model){
		model.addAttribute("pno", pno);
		return "admin/place/placeUpdateForm";
	}

	@RequestMapping("update.pl")
	public String updatePlace(){
		return "";
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
		System.out.println(p);
		System.out.println(upfile);
		
		if(!upfile.getOriginalFilename().contentEquals("")) {
			p.setPicOrigin(upfile.getOriginalFilename());
			p.setPicChange(changeName("place", upfile, session));
		}
		System.out.println(p);
		//이미지를 서버에 저장 -> 링크 임베드 방식?

		return placeService.insertPlace(p) > 0?"redirect:list.pl":"common/errorPage";
	}
	
	//AJAX
	@ResponseBody
	@RequestMapping(value="search.pl", produces="text/xml; charset=UTF-8")
	public String searchPlace(String keyword, @RequestParam(value="pageNo", defaultValue="1") int pageNo) throws IOException{
		
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
		System.out.println(responseText);
		return responseText;
	}
}
