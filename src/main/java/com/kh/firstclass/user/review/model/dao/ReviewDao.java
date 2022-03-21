package com.kh.firstclass.user.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;

@Repository
public class ReviewDao {

	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("reviewMapper.insertReview", r);
	}

	public Review selectReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.selectOne("reviewMapper.selectReview", r);
	}

	public int insertReviewPicture(SqlSessionTemplate sqlSession, ReviewPicture rp) {
		return sqlSession.insert("reviewMapper.insertReviewPicture", rp);
	}

	public ArrayList<Review> selectReviewInformation(SqlSessionTemplate sqlSession, int placeNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewInformation", placeNo);
	}

	public ArrayList<ReviewPicture> pictureReview(SqlSessionTemplate sqlSession, int placeNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.pictureReview", placeNo);
	}

	
	
}