package com.kh.firstclass.admin.place.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.admin.place.model.vo.AreaCode;
import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.admin.place.model.vo.PlaceType;
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

	public int countPlaceByKeyword(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("placeMapper.countPlaceByKeyword", map);
	}

	public ArrayList<Place> searchPlaceList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);		
		
		return (ArrayList)sqlSession.selectList("placeMapper.searchPlaceList", map, rowBounds);
	}

	public int deletePlace(SqlSessionTemplate sqlSession, int placeNo) {
		return sqlSession.update("placeMapper.deletePlace", placeNo);
	}

	public Place selectPlaceDetail(SqlSessionTemplate sqlSession, int placeNo) {
		return sqlSession.selectOne("placeMapper.selectPlaceDetail", placeNo);
	}

	public int updatePlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.update("placeMapper.updatePlace", p);
	}

	public ArrayList<AreaCode> selectAreaCode(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("placeMapper.selectAreaCode");
	}

	public ArrayList<PlaceType> selectPlaceType(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("placeMapper.selectPlaceType");
	}

	public ArrayList<Place> selectUserPlaceList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("placeMapper.selectUserPlaceList", map);
	}

	public Place placeDetailView(SqlSessionTemplate sqlSession, int placeNo) {
		return sqlSession.selectOne("placeMapper.placeDetailView", placeNo);
	}

	public void placeCount(SqlSessionTemplate sqlSession, int placeNo) {
		sqlSession.update("placeMapper.placeCount", placeNo);
	}
	
}
