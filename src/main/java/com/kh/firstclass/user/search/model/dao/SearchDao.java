package com.kh.firstclass.user.search.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.review.model.vo.Review;
import com.kh.firstclass.user.review.model.vo.ReviewPicture;

@Repository
public class SearchDao {

	public int countPlace(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("searchMapper.countPlace", map);
	}

	public ArrayList<Place> selectPlaceList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectPlaceList", map, rowBounds);
	}

	public Place searchPlaceOne(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("searchMapper.selectPlaceOne", map);
	}

	public int insertKeyword(SqlSessionTemplate sqlSession, String[] keywords) {
		int count = 0;
		
		for(String keyword:keywords)
			count += sqlSession.insert("searchMapper.insertKeyword", keyword);
		
		return count;
	}

	public ArrayList<String> countSearchRanking(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("searchMapper.countSearchRanking");
	}

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("searchMapper.selectReviewList", map, rowBounds);
	}

	public int countReview(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("searchMapper.countReview", map);
	}

	public ArrayList<ReviewPicture> selectPictureList(SqlSessionTemplate sqlSession, List<Integer> list) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectPictureList", list);
	}

	public ArrayList<ReviewPicture> selectReviewPicture(SqlSessionTemplate sqlSession, List<Integer> reviewsNum) {
		return (ArrayList)sqlSession.selectList("searchMapper.selectReviewPicture", reviewsNum);
	}

}
