package com.kh.firstclass.user.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.user.schedule.model.vo.AddSchedule;

@Repository
public class ScheduleDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, AddSchedule addschedule) {
		
		return sqlSession.insert("scheduleMapper.insertSchedule",addschedule);
		
	}

}
