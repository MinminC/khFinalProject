package com.kh.firstclass.user.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Review {

	private int revNo;
	private String revContent;
	private int starScore;
	private String status;
	private String createDate;
	private int userNo;
	private int placeNo;
	
	private String userId;
	private String placeName;
}
