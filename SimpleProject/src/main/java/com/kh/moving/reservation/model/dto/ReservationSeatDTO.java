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
public class ReservationSeatDTO {

    private  Long seatId;              // 좌석 ID (시퀀스로 생성)
    private  String seatNumber;       // 좌석 번호 (A01, A02, ...)
    private Long reservationId;       // 예매 ID (FK)
	
    
    // seatId는 시퀀스로 생성되므로 전달할 필요 없음
    public ReservationSeatDTO(String seatNumber, Long reservationId) {
        this.seatNumber = seatNumber;
        this.reservationId = reservationId;
    }
}
