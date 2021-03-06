package com.kh.firstclass.user.review.model.service;

import java.util.ArrayList;

import com.google.gson.JsonElement;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Inquiry;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;

public interface ReviewService {

	// 리뷰 작성(사진 제외 리뷰 나머지 부분)
	int insertReview(Review r);

	// 사진에 리뷰번호를 넘기기위해 select
	Review selectReview(Review r);

	// 사진 정보 DB에 넣기
	int insertReviewPicture(ReviewPicture rp);

	// 리뷰정보(사진정보 x) 조회하기
	ArrayList<Review> selectReviewInformation(int placeNo);

	// 리뷰 사진 정보 조회하기
	ArrayList<ReviewPicture> pictureReview(int placeNo);

	// 리뷰 삭제
	int deleteReview(int revNo);

	// 리뷰사진 삭제
	int deleteReviewPicture(int revNo);

	// 리뷰번호로 changeName 가져와서 파일 삭제
	ArrayList<ReviewPicture> selectChangeName(int revNo);

	// 나의 리뷰정보(사진정보 x) 조회하기
	ArrayList<Review> mySelectReviewInformation(int userNo);

	// 나의 리뷰 사진 정보 조회하기
	ArrayList<ReviewPicture> myPictureReview(int userNo);

	// 리뷰 전체 수(관리자)
	int selectListCount();

	// 리뷰 조회(관리자)
	ArrayList<Review> selectList(PageInfo pi);

	// 리뷰 상세 보기(관리자)
	Review reviewDetail(int no);

	// 리뷰 상세 보기(사진/관리자)
	ArrayList<ReviewPicture> reviewPictureDetail(int no);
	
	
}
