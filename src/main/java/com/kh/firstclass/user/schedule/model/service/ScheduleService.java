package com.kh.firstclass.user.schedule.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.firstclass.user.schedule.model.vo.AddSchedule;
import com.kh.firstclass.user.schedule.model.vo.chatLog;

public interface ScheduleService {
	
	//모임 생성 모임테이블의  insert  > 
	int createSchedule(AddSchedule addschedule);

	int updateScheduleMember(HashMap map);

	int insertSendMassage(HashMap<String, Object> map);

	List<chatLog> selectReceiveMsg(String mono);
	
	

}
