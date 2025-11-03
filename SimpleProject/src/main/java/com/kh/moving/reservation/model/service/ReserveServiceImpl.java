package com.kh.moving.reservation.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.moving.reservation.model.dto.MovieListDTO;
import com.kh.moving.reservation.model.dto.ReservationDTO;
import com.kh.moving.reservation.model.dto.ReservationSeatDTO;
import com.kh.moving.reservation.model.dto.ReserveSeatsDTO;
import com.kh.moving.reservation.model.dto.ScreeningDTO;
import com.kh.moving.reservation.model.mapper.ReservationMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReserveServiceImpl implements ReserveService {

	private final ReservationMapper mapper;
	
	@Override
	public List<MovieListDTO> findMovieList() {
		
		
		return mapper.findMovieList(); 
	}

	
	
	@Override
	public List<ScreeningDTO> findScreeningList(String movieId , String selectDate) {
		
		List<ScreeningDTO> screening = mapper.findScreeningList(movieId);
		
		
		for(ScreeningDTO s : screening) {
			
			int totalSeat = mapper.findReservationCount(s.getScreeningId(), selectDate);
			//총좌석 20개
			s.setSeatsCount(20-totalSeat);
			
			
		}
		
		
		
		
		log.info("돌아온 dto : {}  "+screening );
		
		return screening;
	}
	

	@Override
	public List<String> findReserveSeats(ReserveSeatsDTO reserveSeats) {
		
		List<String> seats = mapper.findReserveSeats(reserveSeats);
		
		log.info("seats 메퍼 돌아온값 : {}" +  seats);
		
		return seats;
	}
	
	
	
	 @Transactional
	    public void saveReservationByUserId(String userId, ReservationDTO reservation) {
	        // 1. userId로 userNo 조회
	        Long userNo = mapper.getUserNoByUserId(userId);
	        reservation.setUserNo(userNo);
	        
	        // 2. TB_RESERVATION INSERT (RESERVATION_STATUS는 DEFAULT 'Y')
	        mapper.insertReservation(reservation);
	        
	        // 3. TB_RESERVATION_SEAT INSERT (선택한 좌석들)
	        for (String seatNumber : reservation.getSeats()) {
	            ReservationSeatDTO seatDTO = new ReservationSeatDTO(
	                seatNumber, 
	                reservation.getReservationId()
	            );
	            mapper.insertReservationSeat(seatDTO);
	        }
	    }
	}

	
	

