package com.kh.firstclass.user.schedule.model.vo;

public class AddSchedule {
	
	private String scheduleTitle;
	private String departureDate;
	private String arrivalDate;
	
	
	public AddSchedule(String scheduleTitle, String departureDate, String arrivalDate) {
		super();
		this.scheduleTitle = scheduleTitle;
		this.departureDate = departureDate;
		this.arrivalDate = arrivalDate;
	}


	public AddSchedule() {
		super();
	}


	public String getScheduleTitle() {
		return scheduleTitle;
	}


	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}


	public String getDepartureDate() {
		return departureDate;
	}


	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}


	public String getArrivalDate() {
		return arrivalDate;
	}


	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}


	@Override
	public String toString() {
		return "AddSchedule [scheduleTitle=" + scheduleTitle + ", departureDate=" + departureDate + ", arrivalDate="
				+ arrivalDate + "]";
	}
	
	
}
