package com.kh.firstclass.user.schedule.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.firstclass.user.schedule.model.dao.ScheduleDao;
import com.kh.firstclass.user.schedule.model.vo.AccountBook;
import com.kh.firstclass.user.schedule.model.vo.AddSchedule;
import com.kh.firstclass.user.schedule.model.vo.DetailSchedule;
import com.kh.firstclass.user.schedule.model.vo.SimpleSchedule;
import com.kh.firstclass.user.schedule.model.vo.chatLog;

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

	@Override
	public int updateScheduleMember(HashMap map) {
		return scheduleDao.updateScheduleMember(sqlSession,map);
	} 
	@Override
	public int insertSendMassage(HashMap<String, Object> map) {
		return scheduleDao.insertSendMassage(sqlSession,map);
	}
	@Override
	public List<chatLog> selectReceiveMsg(String mono) {
		return scheduleDao.selectReceiveMsg(sqlSession,mono);
	}

	@Override
	public List<String> selectMember(String mono) {
		return scheduleDao.selectMember(sqlSession,mono);
	}

	@Override
	public List<String> selectTime(String mono) {
		return scheduleDao.selectTime(sqlSession,mono);
	}
	
	@Override
	public SimpleSchedule selectScheduleTitle(String monoList) {
		return scheduleDao.selectScheduleTitle(sqlSession,monoList);
	}
	
	@Override
	public int addDetailSchedule(DetailSchedule schedule) {
		return scheduleDao.addDetailSchedule(sqlSession,schedule);
	}
	@Override
	public int addAccount(AccountBook accountBook) {
		return scheduleDao.addAccount(sqlSession,accountBook);
}
	@Override
	public List<AccountBook> selectAccount(String mono) {
		return scheduleDao.selectAccount(sqlSession,mono);
	}

}
