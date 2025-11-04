package com.kh.moving.reservation.model.dto;

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
public class ReserveSeatsDTO {

	
	private String movieId;
	private String selectDate;
	private String startTime;
}
