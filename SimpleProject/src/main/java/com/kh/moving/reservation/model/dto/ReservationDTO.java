package com.kh.moving.reservation.model.dto;

import java.util.List;

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
public class ReservationDTO {
	private int userNo;
    private String movieId;        // M008
    private String date;           // 2025-11-07
    private String startTime;      // 22:45
    private Integer screeningId;   // 132
    private List<String> seats;    // [A02, A03, A01]
    
   
}
