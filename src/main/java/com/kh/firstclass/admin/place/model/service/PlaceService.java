package com.kh.firstclass.admin.place.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.firstclass.admin.place.model.vo.AreaCode;
import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.admin.place.model.vo.PlaceType;
import com.kh.firstclass.common.model.vo.PageInfo;

public interface PlaceService {

	//여행지 등록 폼에서 초기에 띄울 정보
	ArrayList<AreaCode> selectAreaCode();
	ArrayList<PlaceType> selectPlaceType();
	
	//여행지 등록
	int insertPlace(Place p);
	
	//여행지 수정
	int updatePlace(Place p);
	
	//여행지 삭제
	int deletePlace(int placeNo);
	
	//등록된 여행지 전체 수
	int countPlaceAll();
	
	//등록된 여행지 조회
	ArrayList<Place> selectPlaceList(PageInfo pi);
	
	//키워드로 검색된 여행지의 총 수
	int countPlaceByKeyword(HashMap<String, String> map);
	
	//등록된 여행지 검색
	ArrayList<Place> searchPlaceList(HashMap<String, String> map, PageInfo pi);
	
	//여행지 상세조회
	Place selectPlaceDetail(int placeNo);
	
	//사용자 여행지 리스트 조회
	ArrayList<Place> selectUserPlaceList(ArrayList<String> keywords);
	
}
