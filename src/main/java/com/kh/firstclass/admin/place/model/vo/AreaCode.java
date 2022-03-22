package com.kh.firstclass.admin.place.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AreaCode {
	private int areaNo;
	private String sido;
	private String gungu;
	private int lon;
	private int lat;
	
	public AreaCode(String sido, int lon, int lat) {
		super();
		this.sido = sido;
		this.lon = lon;
		this.lat = lat;
	}
}
