package com.kh.firstclass.user.schedule.model.vo;

public class SimpleSchedule {
	
	private String mo_no;
	private String mo_title;
	private String mo_departuredate;
	private String mo_arrivaldate;
	
	
	public SimpleSchedule() {
		super();
	}


	public SimpleSchedule(String mo_no, String mo_title, String mo_departuredate, String mo_arrivaldate) {
		super();
		this.mo_no = mo_no;
		this.mo_title = mo_title;
		this.mo_departuredate = mo_departuredate;
		this.mo_arrivaldate = mo_arrivaldate;
	}


	public String getMo_no() {
		return mo_no;
	}


	public void setMo_no(String mo_no) {
		this.mo_no = mo_no;
	}


	public String getMo_title() {
		return mo_title;
	}


	public void setMo_title(String mo_title) {
		this.mo_title = mo_title;
	}


	public String getMo_departuredate() {
		return mo_departuredate;
	}


	public void setMo_departuredate(String mo_departuredate) {
		this.mo_departuredate = mo_departuredate;
	}


	public String getMo_arrivaldate() {
		return mo_arrivaldate;
	}


	public void setMo_arrivaldate(String mo_arrivaldate) {
		this.mo_arrivaldate = mo_arrivaldate;
	}


	@Override
	public String toString() {
		return "SimpleSchedule [mo_no=" + mo_no + ", mo_title=" + mo_title + ", mo_departuredate=" + mo_departuredate
				+ ", mo_arrivaldate=" + mo_arrivaldate + "]";
	}
	
	

}
