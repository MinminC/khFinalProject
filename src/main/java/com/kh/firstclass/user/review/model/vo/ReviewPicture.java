package com.kh.firstclass.user.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReviewPicture {

	private int imgNo; // 사진 번호
	private int revNo; // 리뷰 번호
	private String originName; // 원본명
	private String changeName; // 수정명
	
}