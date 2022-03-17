package com.kh.firstclass.user.schedule.model.service;

import com.kh.firstclass.user.schedule.model.vo.AddSchedule;

public interface ScheduleService {
	
	//모임 생성 모임테이블의  insert  > 
	int createSchedule(AddSchedule addschedule);
	
	

}
