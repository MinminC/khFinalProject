package com.kh.firstclass.user.search.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;

public interface SearchService {

	int countResult(HashMap<String, String> map);

	ArrayList<Place> searchPlaceList(HashMap<String, String> map, PageInfo pi);

	ArrayList<Review> searchReviewList(HashMap<String, String> map, PageInfo pi);

	ArrayList<ReviewPicture> selectPictureList(ArrayList<Integer> reviewNo);

	Place selectPlaceOne(HashMap<String, String> map, PageInfo pi);

}
