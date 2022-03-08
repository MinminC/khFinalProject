package com.kh.firstclass.admin.place.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.common.model.vo.PageInfo;

@Repository
public class PlaceDao {

	public int insertPlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.insert("placeMapper.insertPlace", p);
	}

	public int countPlaceAll(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("placeMapper.countPlaceAll");
	}

	public ArrayList<Place> selectPlaceList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("placeMapper.selectPlaceList", null, rowBounds);
	}

}
