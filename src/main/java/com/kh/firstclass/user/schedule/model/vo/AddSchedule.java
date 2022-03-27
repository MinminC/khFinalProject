package com.kh.firstclass.user.schedule.model.vo;

public class AddSchedule {
	
	private int moNo;
	private String scheduleTitle;
	private String departureDate;
	private String arrivalDate;
	
	public AddSchedule(int moNo, String scheduleTitle, String departureDate, String arrivalDate) {
		super();
		this.moNo = moNo;
		this.scheduleTitle = scheduleTitle;
		this.departureDate = departureDate;
		this.arrivalDate = arrivalDate;
	}

	public AddSchedule() {
		super();
	}

	public int getMoNo() {
		return moNo;
	}

	public void setMoNo(int moNo) {
		this.moNo = moNo;
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
		return "AddSchedule [moNo=" + moNo + ", scheduleTitle=" + scheduleTitle + ", departureDate=" + departureDate
				+ ", arrivalDate=" + arrivalDate + "]";
	}
	
	
	
	
	
}
