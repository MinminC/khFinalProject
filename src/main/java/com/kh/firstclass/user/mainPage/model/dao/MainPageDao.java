package com.kh.firstclass.user.mainPage.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.user.notice.model.vo.Notice;

@Repository
public class MainPageDao {

	public ArrayList<Notice> selectFixedNotice(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("mainpageMapper.selectFixedNotice");
	}

	public ArrayList<Place> selectBestPlace(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainpageMapper.selectBestPlace");
	}

	

}
