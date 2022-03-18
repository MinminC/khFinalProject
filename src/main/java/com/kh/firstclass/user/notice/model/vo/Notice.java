package com.kh.firstclass.user.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int noticeViews;
	private Date noticeDate;
	private String status;
	private int nextNoticeNo;
	private String nextNoticeTitle;
	private int prevNoticeNo;
	private String prevNoticeTitle;
}
