package com.kh.firstclass.user.schedule.model.vo;

public class AccountBook {
	
	private String mo_no;
	private String user_name;
	private String scheduleTitle;
	private String accountDate;
	private String pay;
	
	
	public AccountBook(String mo_no, String user_name, String scheduleTitle, String accountDate, String pay) {
		super();
		this.mo_no = mo_no;
		this.user_name = user_name;
		this.scheduleTitle = scheduleTitle;
		this.accountDate = accountDate;
		this.pay = pay;
	}


	public AccountBook() {
		super();
	}


	public String getMo_no() {
		return mo_no;
	}


	public void setMo_no(String mo_no) {
		this.mo_no = mo_no;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getScheduleTitle() {
		return scheduleTitle;
	}


	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}


	public String getAccountDate() {
		return accountDate;
	}


	public void setAccountDate(String accountDate) {
		this.accountDate = accountDate;
	}


	public String getPay() {
		return pay;
	}


	public void setPay(String pay) {
		this.pay = pay;
	}


	@Override
	public String toString() {
		return "AccountBook [mo_no=" + mo_no + ", user_name=" + user_name + ", scheduleTitle=" + scheduleTitle
				+ ", accountDate=" + accountDate + ", pay=" + pay + "]";
	}
	
	
	
	
}
