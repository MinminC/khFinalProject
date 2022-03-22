package com.kh.firstclass.user.mainPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.admin.place.model.vo.Place;
import com.kh.firstclass.user.mainPage.model.dao.MainPageDao;
import com.kh.firstclass.user.notice.model.vo.Notice;

@Service
public class MainPageServiceImpl implements MainPageService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MainPageDao mainPageDao;
	
	@Override 
	public ArrayList<Notice> selectFixedNotice() {
		return mainPageDao.selectFixedNotice(sqlSession);
	}

	@Override
	public ArrayList<Place> selectBestPlace() {
		return mainPageDao.selectBestPlace(sqlSession);
	}


}
