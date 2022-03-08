package com.kh.firstclass.admin.place.model.service;

import java.util.ArrayList;

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
		return null;
	}

	@Override
	public ArrayList<PlaceType> selectPlaceType() {
		return null;
	}

	@Override
	public int insertPlace(Place p) {
		return placeDao.insertPlace(sqlSession, p);
	}

	@Override
	public int updatePlace(Place p) {
		return 0;
	}

	@Override
	public int deletePlace(Place p) {
		return 0;
	}

	@Override
	public ArrayList<Place> selectPlaceList(PageInfo pi) {
		return placeDao.selectPlaceList(sqlSession, pi);
	}

	@Override
	public ArrayList<Place> searchPlaceList(String keyword, PageInfo pi) {
		return null;
	}

	@Override
	public int countPlaceAll() {
		return placeDao.countPlaceAll(sqlSession);
	}

}
