package com.kh.firstclass.user.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Inquiry;
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

	@Override
	public int deleteReview(int revNo) {
		return reviewDao.deleteReview(sqlSession, revNo);
	}

	@Override
	public int deleteReviewPicture(int revNo) {
		return reviewDao.deleteReviewPicture(sqlSession, revNo);
	}

	@Override
	public ArrayList<ReviewPicture> selectChangeName(int revNo) {
		return reviewDao.selectChangeName(sqlSession, revNo);
	}

	@Override
	public ArrayList<Review> mySelectReviewInformation(int userNo) {
		return reviewDao.mySelectReviewInformation(sqlSession, userNo);
	}

	@Override
	public ArrayList<ReviewPicture> myPictureReview(int userNo) {
		return reviewDao.myPictureReview(sqlSession, userNo);
	}

	@Override
	public int selectListCount() {
		return reviewDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Review> selectList(PageInfo pi) {
		return reviewDao.selectList(sqlSession, pi);
	}

	@Override
	public Review reviewDetail(int no) {
		return reviewDao.reviewDetail(sqlSession, no);
	}

	@Override
	public ArrayList<ReviewPicture> reviewPictureDetail(int no) {
		return reviewDao.reviewPictureDetail(sqlSession, no);
	}

	
	
}
