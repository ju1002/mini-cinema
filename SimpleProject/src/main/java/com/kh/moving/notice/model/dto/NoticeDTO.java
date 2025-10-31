package com.kh.moving.notice.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString	
public class NoticeDTO {

	private Long noticeNo;
	private int userNo;
	private String noticeTitle;
	private String noticeContent;
	private int count;
	private Date createDate;
	private String status;
}
