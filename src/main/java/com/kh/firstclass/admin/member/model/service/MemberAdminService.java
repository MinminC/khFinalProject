package com.kh.firstclass.admin.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.firstclass.common.model.vo.PageInfo;
import com.kh.firstclass.user.member.model.vo.Member;

public interface MemberAdminService {

	int selectMemberCount();
	
	ArrayList<Member> selectMember(PageInfo pi);

	int adminDeleteMember(ArrayList list);

	int selectSearchCount(HashMap<String, String> map);

	ArrayList<Member> adminSearchMember(PageInfo pi, HashMap<String, String> map);

	

	
	

	
}
