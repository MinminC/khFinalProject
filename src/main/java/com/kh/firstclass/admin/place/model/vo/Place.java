package com.kh.firstclass.admin.place.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Place {

	private int placeNo;
	private String placeName;
	private String placeAddress;
	private int placeLon;
	private int placeLat;
	private String placeDes;
	private String placeTags;
	private String area;
	private String typeCode;
	private String filePath;
	private String picOrigin;
	private String picChange;
	private String createDate;
	private String modifyDate;
	private String placeStatus;
	private	int	views;
}
