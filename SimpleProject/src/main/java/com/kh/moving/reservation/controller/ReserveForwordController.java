package com.kh.moving.reservation.controller;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("reserve")
@RequiredArgsConstructor
public class ReserveForwordController {

	
	
	@GetMapping
	public String forward(@RequestParam(value="movieId" , defaultValue = "M001") String movieId ,Model model) {
		
		

		//log.info("movie Id  : {}" ,movieId );
		model.addAttribute("selectedMovieId" , movieId);
		
		
		
		
		return "reservation/booking";
		
	}
	
	
	
}
