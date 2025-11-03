package com.kh.moving.reservation.model.service;

import java.util.List;

import com.kh.moving.reservation.model.dto.MovieListDTO;
import com.kh.moving.reservation.model.dto.ReserveSeatsDTO;
import com.kh.moving.reservation.model.dto.ScreeningDTO;

public interface ReserveService {

	
	List<MovieListDTO> findMovieList();

	
	List<ScreeningDTO> findScreeningList(String movieId , String selectDate);
	
	List<String> findReserveSeats(ReserveSeatsDTO reserveSeats);
	
}
