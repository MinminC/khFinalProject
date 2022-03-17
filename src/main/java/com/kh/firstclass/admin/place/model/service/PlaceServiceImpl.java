package com.kh.firstclass.admin.place.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.admin.place.model.dao.PlaceDao;
import com.kh.firstclass.admin.place.model.vo.AreaCode;
import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.admin.place.model.vo.PlaceType;
import com.kh.firstclass.common.model.vo.PageInfo;

@Service
public class PlaceServiceImpl implements PlaceService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PlaceDao placeDao;
	
	@Override
	public ArrayList<AreaCode> selectAreaCode() {
		return placeDao.selectAreaCode(sqlSession);
	}

	@Override
	public ArrayList<PlaceType> selectPlaceType() {
		return placeDao.selectPlaceType(sqlSession);
	}

	@Override
	public int insertPlace(Place p) {
		return placeDao.insertPlace(sqlSession, p);
	}

	@Override
	public int updatePlace(Place p) {
		return placeDao.updatePlace(sqlSession, p);
	}

	@Override
	public int deletePlace(int placeNo) {
		return placeDao.deletePlace(sqlSession, placeNo);
	}

	@Override
	public ArrayList<Place> selectPlaceList(PageInfo pi) {
		return placeDao.selectPlaceList(sqlSession, pi);
	}

	@Override
	public ArrayList<Place> searchPlaceList(HashMap<String, String> map, PageInfo pi) {
		return placeDao.searchPlaceList(sqlSession, map, pi);
	}

	@Override
	public int countPlaceAll() {
		return placeDao.countPlaceAll(sqlSession);
	}

	@Override
	public int countPlaceByKeyword(HashMap<String, String> map) {
		return placeDao.countPlaceByKeyword(sqlSession, map);
	}

	@Override
	public Place selectPlaceDetail(int placeNo) {
		return placeDao.selectPlaceDetail(sqlSession, placeNo);
	}

	@Override
	public ArrayList<Place> selectUserPlaceList(HashMap<String, String> map) {
		return placeDao.selectUserPlaceList(sqlSession, map);
	}

}
