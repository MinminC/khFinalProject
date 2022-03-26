package com.kh.firstclass.user.search.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	public int countPlace(HashMap<String, Object> map) {
		return searchDao.countPlace(sqlSession, map);
	}

	@Override
	public ArrayList<Place> selectPlaceList(HashMap<String, Object> map, PageInfo pi) {
		return searchDao.selectPlaceList(sqlSession, map, pi);
	}

	@Override
	public ArrayList<Review> selectReviewList(HashMap<String, Object> map, PageInfo pi) {
		return searchDao.selectReviewList(sqlSession, map, pi);
	}

	@Override
	public ArrayList<ReviewPicture> selectPictureList(List<Integer> reviewNo) {
		return searchDao.selectPictureList(sqlSession, reviewNo);
	}

	@Override
	public Place selectPlaceOne(HashMap<String, String> map) {
		return searchDao.searchPlaceOne(sqlSession, map);
	}

	@Override
	public int insertKeyword(String[] keywords) {
		return searchDao.insertKeyword(sqlSession, keywords);
	}

	@Override
	public ArrayList<String> countSearchRanking() {
		return searchDao.countSearchRanking(sqlSession);
	}

	@Override
	public int countReview(HashMap<String, Object> map) {
		return searchDao.countReview(sqlSession, map);
	}

	@Override
	public ArrayList<ReviewPicture> selectReviewPicture(List<Integer> reviewsNum) {
		return searchDao.selectReviewPicture(sqlSession, reviewsNum);
	}

}
