package com.kh.moving.reservation.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.moving.reservation.model.dto.MovieListDTO;
import com.kh.moving.reservation.model.mapper.ReservationMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReserveServiceImpl implements ReserveService {

	private final ReservationMapper mapper;
	
	@Override
	public List<MovieListDTO> findMovieList() {
		
		
		return mapper.findMovieList(); 
	}

	
	
	
	
	
}
