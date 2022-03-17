package com.kh.firstclass.user.schedule.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.user.schedule.model.dao.ScheduleDao;
import com.kh.firstclass.user.schedule.model.vo.AddSchedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createSchedule(AddSchedule addschedule) {
	return scheduleDao.insertSchedule(sqlSession,addschedule);
	
	} 



}
