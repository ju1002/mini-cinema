package com.kh.moving.event.model.dto;

import java.sql.Date;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class EventDTO {
	private int eventNo;        // 이벤트 번호 (PK)
	private String eventTitle;  // 이벤트 제목
	private String description; // 이벤트 내용
	private Date startDate;     // 시작일
	private Date endDate;       // 종료일
	private int userNo;         // 작성자(회원 번호)
}
