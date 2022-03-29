package com.kh.firstclass.user.review.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Inquiry;
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

	public int deleteReview(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.delete("reviewMapper.deleteReview", revNo);
	}

	public int deleteReviewPicture(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.delete("reviewMapper.deleteReviewPicture", revNo);
	}

	public ArrayList<ReviewPicture> selectChangeName(SqlSessionTemplate sqlSession, int revNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectChangeName", revNo);
	}

	public ArrayList<Review> mySelectReviewInformation(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.mySelectReviewInformation", userNo);
	}

	public ArrayList<ReviewPicture> myPictureReview(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.myPictureReview", userNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.selectListCount");
	}

	public ArrayList<Review> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectList", null, rowBounds);
		
	}

	public Review reviewDetail(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("reviewMapper.reviewDetail", no);
	}

	public ArrayList<ReviewPicture> reviewPictureDetail(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("reviewMapper.reviewPictureDetail", no);
	}
	
}
