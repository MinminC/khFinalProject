package com.kh.firstclass.user.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


	
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Member {
	
	private int userNo;
	private String userId; //USER_ID
	private String userPwd; //USER_PWD
	private String userName; //USER_NAME
	private String birth;
	private String gender; //GENDER
	private String phone; //PHONE
	private String email; //EMAIL 
	private Date enrollDate; //ENROLL_DATE
	private Date modifyDate; //MODIFY_DATE
	private String status; //STATUS
	private int moNo;

}


