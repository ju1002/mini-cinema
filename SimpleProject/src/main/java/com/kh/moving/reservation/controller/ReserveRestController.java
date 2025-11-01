package com.kh.moving.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public List<MovieListDTO> findMovieList(HttpSession session){
		
		log.info("들어온값 : {}" ,reserveService.findMovieList());
		
		String userInfo = (String) session.getAttribute("userInfo");
		
		log.info("들어온 값 : {}"+userInfo);
		
		return reserveService.findMovieList();
		
		
	}
	
	@GetMapping("/showtimes")
	public String getShowTime(@RequestParam String movieId , @RequestParam String date) {
		log.info("들어온값은 : {} , {} " , movieId , date);
		
		
		reserveService.findShowTime(movieId,date);
		
		return null;
	}
	
	
}
