package com.kh.moving.reservation.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.moving.reservation.model.dto.MovieListDTO;
import com.kh.moving.reservation.model.service.ReserveService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RestController
@RequestMapping("/ajax/reservation")
@RequiredArgsConstructor
public class ReserveRestController {

	private final ReserveService reserveService;
	
	@GetMapping
	public List<MovieListDTO> findMovieList(){
		
		log.info("들어온값 : {}" ,reserveService.findMovieList());
		
		return reserveService.findMovieList();
		
		
	}
	
	
}
