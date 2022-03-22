package com.kh.firstclass.user.search.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;

@Repository
public class SearchDao {

	public int countResult(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("searchMapper.countResult", map);
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

}
