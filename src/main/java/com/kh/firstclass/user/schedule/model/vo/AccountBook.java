package com.kh.firstclass.user.schedule.model.vo;

public class AccountBook {
	
	private String mo_no;
	private String user_name;
	private String scheduleTitle;
	private String accountDate;
	private String pay;
	
	
	public AccountBook(String mono, String username, String scheduleTitle, String accountDate, String pay) {
		super();
		this.mo_no = mono;
		this.user_name = username;
		this.scheduleTitle = scheduleTitle;
		this.accountDate = accountDate;
		this.pay = pay;
	}


	public AccountBook() {
		super();
	}


	public String getMono() {
		return mo_no;
	}


	public void setMono(String mono) {
		this.mo_no = mono;
	}


	public String getUsername() {
		return user_name;
	}


	public void setUsername(String username) {
		this.user_name = username;
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
		return "AccountBook [mono=" + mo_no + ", username=" + user_name + ", scheduleTitle=" + scheduleTitle
				+ ", accountDate=" + accountDate + ", pay=" + pay + "]";
	}
	
	
	
	
}
