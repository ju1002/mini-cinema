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

	private String movieId;          // 영화 ID
    private String date;              // 상영 날짜 (YYYY-MM-DD)
    private String startTime;         // 상영 시작 시간
    private Long screeningId;          // 상영 일정 ID (⭐ 중요)
    private List<String> seats;       // 선택한 좌석 리스트 ["A01", "A02", ...]
    
    // ========== DB 저장용 데이터 ==========
    private Long reservationId;        // 예매 ID (시퀀스로 생성)
    private Long userNo;               // 회원 번호 (세션에서 가져옴)
	
}
