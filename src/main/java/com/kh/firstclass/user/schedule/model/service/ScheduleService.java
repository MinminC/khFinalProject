package com.kh.firstclass.user.schedule.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.firstclass.user.schedule.model.vo.AccountBook;
import com.kh.firstclass.user.schedule.model.vo.AddSchedule;
import com.kh.firstclass.user.schedule.model.vo.DetailSchedule;
import com.kh.firstclass.user.schedule.model.vo.SimpleSchedule;
import com.kh.firstclass.user.schedule.model.vo.chatLog;

public interface ScheduleService {
	
	//모임 생성 모임테이블의  insert  > 
	int createSchedule(AddSchedule addschedule);

	int updateScheduleMember(HashMap map);

	int insertSendMassage(HashMap<String, Object> map);

	List<chatLog> selectReceiveMsg(String mono);

	List<String> selectMember(String mono);

	List<String> selectTime(String mono);

	SimpleSchedule selectScheduleTitle(String string);

	int addDetailSchedule(DetailSchedule schedule);

	int addAccount(AccountBook accountBook);

	List<AccountBook> selectAccount(String mono);
	
	

}
