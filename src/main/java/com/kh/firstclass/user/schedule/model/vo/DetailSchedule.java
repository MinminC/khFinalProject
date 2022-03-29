package com.kh.firstclass.user.schedule.model.vo;

public class DetailSchedule {
	
	private String mo_no;
	private String activites;
	private String postNum;
	private String address;
	private String detailAddress;
	private String scheduleDate;
	private String scheduleTitle;
	private String introduction;
	
	public DetailSchedule(String mo_no, String activites, String postNum, String address, String detailAddress,
			String scheduleDate, String scheduleTitle, String introduction) {
		super();
		this.mo_no = mo_no;
		this.activites = activites;
		this.postNum = postNum;
		this.address = address;
		this.detailAddress = detailAddress;
		this.scheduleDate = scheduleDate;
		this.scheduleTitle = scheduleTitle;
		this.introduction = introduction;
	}

	public DetailSchedule() {
		super();
	}

	public String getMo_no() {
		return mo_no;
	}

	public void setMo_no(String mo_no) {
		this.mo_no = mo_no;
	}

	public String getActivites() {
		return activites;
	}

	public void setActivites(String activites) {
		this.activites = activites;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Override
	public String toString() {
		return "DetailSchedule [mo_no=" + mo_no + ", activites=" + activites + ", postNum=" + postNum + ", address="
				+ address + ", detailAddress=" + detailAddress + ", scheduleDate=" + scheduleDate + ", scheduleTitle="
				+ scheduleTitle + ", introduction=" + introduction + "]";
	}
	
	
	

}
