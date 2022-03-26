package com.kh.firstclass.user.schedule.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.user.schedule.model.vo.AddSchedule;
import com.kh.firstclass.user.schedule.model.vo.chatLog;

@Repository
public class ScheduleDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, AddSchedule addschedule) {
		return sqlSession.insert("scheduleMapper.insertSchedule",addschedule);
	}

	public int updateScheduleMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("scheduleMapper.updateScheduleMember",map);
	}

	public int insertSendMassage(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("scheduleMapper.insertSendMassage",map);
	}

	public List<chatLog> selectReceiveMsg(SqlSessionTemplate sqlSession, String mono) {
		return sqlSession.selectList("scheduleMapper.selectReceiveMsg", mono);
	}

}
