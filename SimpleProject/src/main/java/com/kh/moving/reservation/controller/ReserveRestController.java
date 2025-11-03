package com.kh.moving.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.moving.member.model.dto.MemberDTO;
import com.kh.moving.reservation.model.dto.MovieListDTO;
import com.kh.moving.reservation.model.dto.ReservationDTO;
import com.kh.moving.reservation.model.dto.ReserveSeatsDTO;
import com.kh.moving.reservation.model.dto.ScreeningDTO;
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
		
		//log.info("들어온값 : {}" ,reserveService.findMovieList());
		
		String userInfo = (String) session.getAttribute("userInfo");
		
		//log.info("들어온 값 : {}"+userInfo);
		
		return reserveService.findMovieList();
		
		
	}
	
	@GetMapping("/showtimes")
	public ResponseEntity<?> findShowTime(@RequestParam String movieId , @RequestParam String date) {
		log.info("들어온값은 : {} , {} " , movieId , date);
		
		// 서비스에 가서 count랑 상영시간을 가져와야함 
		List<ScreeningDTO> screening =  reserveService.findScreeningList(movieId,date);
		
		
		
		return ResponseEntity.ok(screening);
	}
	
	@GetMapping("/seats")
	public ResponseEntity<?> findReserveSeats(@RequestParam String movieId , @RequestParam String date ,@RequestParam String startTime){
		
		
		//log.info("seats들어온값은 : {} , {} " , movieId , date);
		//log.info("startTime  = {} " , startTime);
		
		ReserveSeatsDTO reserveSeats = new ReserveSeatsDTO(movieId,date,startTime);
		
		
		List<String> seats = reserveService.findReserveSeats(reserveSeats);
		
		
		//log.info("seats : {}"+seats);
		
		return ResponseEntity.ok(seats);
		
	}
	
	@PostMapping
	public ResponseEntity<?> createReservation(@RequestBody ReservationDTO dto, HttpSession session){
		
		
	            // 세션에서 USER_NO 가져오기 (로그인한 사용자)
	            MemberDTO userInfo  = (MemberDTO) session.getAttribute("loginMember");
	          
	            dto.setUserNo(userInfo.getUserNo());
	            log.info("dto 들어오는값 : {}  " + dto);
	            
	            // 예약 처리
	            reserveService.saveReservation(dto);
	            
	          return null;
	            
	        
	    }
	}