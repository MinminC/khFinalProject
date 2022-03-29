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
	
	//weather
	private String sky;//하늘상태
	private String temperatureMin;//최저기온
	private String temperatureMax;//최고기온
	private String humidity;//습도
	private String rain;//강수 형태
	
	public AreaCode(String sido, int lon, int lat) {
		super();
		this.sido = sido;
		this.lon = lon;
		this.lat = lat;
	}
}
