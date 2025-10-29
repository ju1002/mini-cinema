package com.kh.moving.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("reserve")
@RequiredArgsConstructor
public class ReserveController {

	
	
	@GetMapping
	public String forward() {
		
		return "reservation/booking";
	}
	
}
