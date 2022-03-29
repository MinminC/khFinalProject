package com.kh.firstclass.user.schedule.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.firstclass.user.schedule.model.vo.AccountBook;
import com.kh.firstclass.user.schedule.model.vo.AddSchedule;
import com.kh.firstclass.user.schedule.model.vo.DetailSchedule;
import com.kh.firstclass.user.schedule.model.vo.SimpleSchedule;
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

	public List<String> selectMember(SqlSessionTemplate sqlSession, String mono) {
		return sqlSession.selectList("scheduleMapper.selectMember",mono);
	}

	public List<String> selectTime(SqlSessionTemplate sqlSession, String mono) {
		return sqlSession.selectList("scheduleMapper.selectTime",mono);
		
	}

	public SimpleSchedule selectScheduleTitle(SqlSessionTemplate sqlSession, String monoList) {
		return sqlSession.selectOne("scheduleMapper.selectScheduleTitle",monoList);
	}

	public int addDetailSchedule(SqlSessionTemplate sqlSession, DetailSchedule schedule) {
		return sqlSession.insert("scheduleMapper.addDetailSchedule",schedule);
	}

	public int addAccount(SqlSessionTemplate sqlSession, AccountBook accountBook) {
		return sqlSession.insert("scheduleMapper.addAccount",accountBook);
	}

	public List<AccountBook> selectAccount(SqlSessionTemplate sqlSession, String mono) {
		return sqlSession.selectList("scheduleMapper.selectAccount",mono);
	}

}
