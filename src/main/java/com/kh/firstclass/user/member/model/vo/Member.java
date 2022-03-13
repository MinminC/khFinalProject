package com.kh.firstclass.user.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

	
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
	private ArrayList moNo = new ArrayList<>();
	
	
	public Member() {
		super();
	}


	public Member(int userNo, String userId, String userPwd, String userName, String birth, String gender, String phone,
			String email, Date enrollDate, Date modifyDate, String status, ArrayList moNo) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.moNo = moNo;
	}


	public Member(int userNo, String userId, String userPwd, String userName, String birth, String gender, String phone,
			String email, Date enrollDate, Date modifyDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public ArrayList getMoNo() {
		return moNo;
	}

	//모임 추가 add 셋터 오버로딩 = >  디폴트 빈 리스트
	public void setMoNo(int moNo) {
		this.moNo.add(moNo);
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", birth=" + birth + ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", enrollDate="
				+ enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + ", moNo=" + moNo + "]";
	}
	
}


