package com.kh.firstclass.admin.place.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.admin.place.model.vo.Place;

@Repository
public class PlaceDao {

	public int insertPlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.insert("placeMapper.insertPlace", p);
	}

}
