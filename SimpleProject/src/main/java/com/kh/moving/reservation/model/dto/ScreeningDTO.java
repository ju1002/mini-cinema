package com.kh.moving.reservation.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ScreeningDTO {
	   private int screeningId;       // 상영시간 ID
	    private String startTime;      // 시간
	    private int seatsCount;    // 카운트   
}
