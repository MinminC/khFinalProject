package com.kh.firstclass.user.schedule.model.vo;

public class AccountBook {
	
	private String mono;
	private String username;
	private String scheduleTitle;
	private String accountDate;
	private String pay;
	
	
	public AccountBook(String mono, String username, String scheduleTitle, String accountDate, String pay) {
		super();
		this.mono = mono;
		this.username = username;
		this.scheduleTitle = scheduleTitle;
		this.accountDate = accountDate;
		this.pay = pay;
	}


	public AccountBook() {
		super();
	}


	public String getMono() {
		return mono;
	}


	public void setMono(String mono) {
		this.mono = mono;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
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
		return "AccountBook [mono=" + mono + ", username=" + username + ", scheduleTitle=" + scheduleTitle
				+ ", accountDate=" + accountDate + ", pay=" + pay + "]";
	}
	
	
	
	
}
