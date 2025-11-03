package com.kh.moving.event.model.dto;

import java.sql.Date;

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
public class EventDTO {
	private int eventNo;
	private String eventTitle;
	private String Description;
	private Date startDate;
	private Date endDate;

	private int userNo;

}
