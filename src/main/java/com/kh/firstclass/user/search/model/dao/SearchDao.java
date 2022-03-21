package com.kh.firstclass.user.search.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;

@Repository
public class SearchDao {

	public int countResult(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("searchMapper.countResult", map);
	}

	public ArrayList<Place> searchPlaceList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("searchMapper.searchPlaceList", map);
	}

	public Place searchPlaceOne(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		return sqlSession.selectOne("searchMapper.selectPlaceOne", map);
	}

}
