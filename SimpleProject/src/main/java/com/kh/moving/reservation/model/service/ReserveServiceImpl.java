package com.kh.moving.reservation.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.moving.reservation.model.dto.MovieListDTO;
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
	
	
	
	
	
}
