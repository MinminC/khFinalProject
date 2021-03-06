package com.kh.firstclass.user.search.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;

public interface SearchService {

	int countPlace(HashMap<String, Object> map);
	
	int countReview(HashMap<String, Object> map);

	ArrayList<Place> selectPlaceList(HashMap<String, Object> map, PageInfo pi);

	ArrayList<Review> selectReviewList(HashMap<String, Object> map, PageInfo pi);

	ArrayList<ReviewPicture> selectPictureList(List<Integer> reviewNo);

	Place selectPlaceOne(HashMap<String, String> map);

	int insertKeyword(String[] keywords);

	ArrayList<String> countSearchRanking();

	ArrayList<ReviewPicture> selectReviewPicture(List<Integer> reviewsNum);

}
