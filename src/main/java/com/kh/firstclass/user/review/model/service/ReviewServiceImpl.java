package com.kh.firstclass.user.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.user.review.model.dao.ReviewDao;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession; //기존의 mybatis의 sqlSession을 대체
	
	@Override
	public int insertReview(Review r) {
		return reviewDao.insertReview(sqlSession, r);
	}

	@Override
	public Review selectReview(Review r) {
		return reviewDao.selectReview(sqlSession, r);
	}

	@Override
	public int insertReviewPicture(ReviewPicture rp) {
		return reviewDao.insertReviewPicture(sqlSession, rp);
		
	}

	@Override
	public ArrayList<Review> selectReviewInformation(int placeNo) {
		return reviewDao.selectReviewInformation(sqlSession, placeNo);
	}

	@Override
	public ArrayList<ReviewPicture> pictureReview(int placeNo) {
		return reviewDao.pictureReview(sqlSession, placeNo);
	}

	
	
}
