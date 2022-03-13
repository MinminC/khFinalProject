package com.kh.firstclass.user.schedule.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.firstclass.user.schedule.model.dao.ScheduleDao;

public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession; 

	@Override
	public int createSchedule() {
		
		
		return 0;
	}

}
