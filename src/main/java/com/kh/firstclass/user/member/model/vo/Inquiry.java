package com.kh.firstclass.user.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Inquiry {

	private int inqNo;         // 문의 번호
	private int userNo;         // 작성자의 회원번호
	private String inqTitle;    // 제목
	private String inqContent;  // 내용
	private String inqReply;   //  답글
	private String inqStatus;  // 답변 상태 : 처리중(N), 처리완료(Y)
	private String status;     // 문의글 상태 : 삭제(N)
	private String createDate; // 날짜
}
