package com.kh.firstclass.admin.place.controller;

import static com.kh.firstclass.common.model.vo.PageInfo.getPageInfo;
import static com.kh.firstclass.common.model.vo.SaveFile.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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
			model.addAttribute("alertMsg", "????????????");
			return "redirect:detail.pl?placeNo="+p.getPlaceNo();
		}else {
			model.addAttribute("alertMsg", "????????????");
			return "common/errorPage";
		}
	}

	@RequestMapping("insertForm.pl")
	public String enrollPlaceForm(Model model) {
		//???????????? ????????? ?????? ???
		ArrayList<AreaCode> areaCode = placeService.selectAreaCode();
		ArrayList<PlaceType> placeType = placeService.selectPlaceType();
		model.addAttribute("areaCode", areaCode);
		model.addAttribute("placeType", placeType);
		
		return "admin/place/placeInsertForm";
	}
	
	/**
	 * ?????? ????????? ????????? ???????????? ??????
	 * @param p
	 * @param upfile
	 * @param imgPath
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("insert.pl")
	public String insertPlace(Place p, MultipartFile upfile, String imgPath, HttpSession session) throws IOException {
//		???????????? ????????? inputStream ???????????? ????????? ??????->????????? ????????? ????????? ?????? ???????????????
		//???????????? ????????? ?????? -> ?????? ????????? ??????
		if(upfile == null || upfile.getOriginalFilename().equals("")) {//?????? ????????? ?????? ??????(?????? ??????)
			String fileName = changeImgName("place", imgPath, session);
			p.setPicOrigin(fileName);
			p.setPicChange(fileName);
		}else {//?????? ????????? ??????
			p.setPicOrigin(upfile.getOriginalFilename());
			p.setPicChange(changeName("place", upfile, session));
		}

		return placeService.insertPlace(p) > 0?"redirect:list.pl":"common/errorPage";
	}
	
	/**
	 * ????????? ???????????? ???????????? ???????????? ?????????????????? ???????????? AJAX ?????? ??????
	 * @param keyword ????????? ??????
	 * @param pageNo pagination??? ????????? ??????
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="searchOpenData.pl", produces="text/xml; charset=UTF-8")
	public String searchOpenData(@RequestParam(value="contentTypeId", defaultValue="12") int contentTypeId
		, String keyword, @RequestParam(value="pageNo", defaultValue="1") int pageNo) throws IOException{
		
		//url ??????
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword";
		
		url += "?serviceKey="+SERVICE_KEY;
		url += "&MobileApp=AppTest";
		url += "&MobileOS=ETC";
		url += "&pageNo="+pageNo;
		url += "&numOfRows=5";
		url += "&listYN=Y";
		url += "&arrange=A";
		url += "&contentTypeId="+contentTypeId;
		url += "&keyword="+URLEncoder.encode(keyword, "UTF-8");
		
		//API??? ????????????
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		//?????? ??????
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
	@RequestMapping(value="select.pl", produces="application/json; charset=UTF-8")
	public ArrayList<Place> selectUserPlaceList(@RequestParam(value="tag", defaultValue="") String tag
				, @RequestParam(value="area", defaultValue="??????") String area, Model model) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("tag", tag);
		map.put("area", area);
		
		ArrayList<Place> list = placeService.selectUserPlaceList(map);
		
		return list;
	}
	
	/**
	 * ????????? ???????????? AJAX
	 * Gson 2.8.6????????? ????????????, ????????? ???????????? ????????? ??????
	 * timeTable??? ????????? ???????????? ?????????????????????
	 * ?????? ?????? ????????? ????????? ????????????
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="weather", produces="application/json; charset=UTF-8")
	public ArrayList<AreaCode> findWeather() throws IOException{
		ArrayList<AreaCode> area = new ArrayList<>();
		area.add(new AreaCode("??????", 60, 127));
		area.add(new AreaCode("??????", 55, 124));
		area.add(new AreaCode("??????", 60, 121));
		area.add(new AreaCode("??????", 92, 131));
		area.add(new AreaCode("??????", 69, 106));
		area.add(new AreaCode("??????", 68, 100));
		area.add(new AreaCode("??????", 90, 77));
		area.add(new AreaCode("??????", 91, 106));
		area.add(new AreaCode("??????", 63, 89));
		area.add(new AreaCode("??????", 50, 67));
		area.add(new AreaCode("??????", 52, 38));
		//?????? ????????? ???????????? ????????????
		
		for(int i=0; i<area.size();i++) {
			//url ??????
			String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
			url += "?serviceKey="+SERVICE_KEY;
			url += "&pageNo=1&numOfRows=1000&dataType=json";
			Date today = new Date();
			Date yesterday = new Date(today.getTime()+(1000*60*60*24*-1));
			SimpleDateFormat dayFormat = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat timeFormat = new SimpleDateFormat("HHmmss");
			String now = timeFormat.format(today);

			//?????? ?????? -> 3?????? ??????
			String day = dayFormat.format(today);
			String toHour = "";
			int[] timeTable = {2, 5, 8, 11, 14, 17, 20, 23};
			for(int k=0;k<timeTable.length;k++) {
				String hour = now.substring(0,2);
				int hourLab = Integer.parseInt(hour)-timeTable[k];
				if(hour.equals("00") || hour.equals("01")) {	
					day = dayFormat.format(yesterday);
					toHour = "23";
				}
				if(hourLab == -2|| hourLab == -1 || hourLab == 0) {
					if(timeTable[k]<10)
						toHour += "0"+timeTable[k];
					else
						toHour += timeTable[k];
					break;
				}
			}
			url += "&base_date="+day;
			url += "&base_time="+toHour+"00";
			url += "&nx="+area.get(i).getLon();
			url += "&ny="+area.get(i).getLat();
			System.out.println(url);
			//API??? ????????????
			URL requestUrl = new URL(url);
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			urlConnection.setRequestMethod("GET");
			
			//?????? ??????
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			//??????
			String responseText = "";
			String line;
			while((line = br.readLine()) != null) {
				responseText += line;
			}
			
			br.close();
			urlConnection.disconnect();
			System.out.println(1+" "+JsonParser.parseString(responseText));
			System.out.println(2+" "+JsonParser.parseString(responseText).getAsJsonObject());
			System.out.println(3+" "+(JsonParser.parseString(responseText).getAsJsonObject()).getAsJsonObject("response"));
			System.out.println(4+" "+((JsonParser.parseString(responseText).getAsJsonObject()).getAsJsonObject("response")).getAsJsonObject("body"));
			System.out.println(5+" "+(((JsonParser.parseString(responseText).getAsJsonObject()).getAsJsonObject("response")).getAsJsonObject("body")).getAsJsonObject("items"));
			JsonObject itemsObj = (((JsonParser.parseString(responseText).getAsJsonObject()).getAsJsonObject("response")).getAsJsonObject("body")).getAsJsonObject("items");
			JsonArray itemArr = itemsObj.getAsJsonArray("item");
			for(int j = 0; j< itemArr.size(); j++) {
				JsonObject item = itemArr.get(j).getAsJsonObject();
				String category = item.get("category").getAsString();
				switch(category) {
					case "SKY":area.get(i).setSky(item.get("fcstValue").getAsString());
						break;
					case "TMN":area.get(i).setTemperatureMin(item.get("fcstValue").getAsString());
						break;
					case "TMX":area.get(i).setTemperatureMax(item.get("fcstValue").getAsString());
						break;
					case "REH":area.get(i).setHumidity(item.get("fcstValue").getAsString());
						break;
					case "PTY":area.get(i).setRain(item.get("fcstValue").getAsString());
						break;
				}
			}
		}
		return area;
	}
}
