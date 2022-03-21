package com.kh.firstclass.user.search.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;
import com.kh.firstclass.user.search.model.dao.SearchDao;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDao searchDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int countResult(HashMap<String, String> map) {
		return searchDao.countResult(sqlSession, map);
	}

	@Override
	public ArrayList<Place> searchPlaceList(HashMap<String, String> map, PageInfo pi) {
		return searchDao.searchPlaceList(sqlSession, map, pi);
	}

	@Override
	public ArrayList<Review> searchReviewList(HashMap<String, String> map, PageInfo pi) {
		return null;
	}

	@Override
	public ArrayList<ReviewPicture> selectPictureList(ArrayList<Integer> reviewNo) {
		return null;
	}

	@Override
	public Place selectPlaceOne(HashMap<String, String> map, PageInfo pi) {
		return searchDao.searchPlaceOne(sqlSession, map, pi);
	}

}
