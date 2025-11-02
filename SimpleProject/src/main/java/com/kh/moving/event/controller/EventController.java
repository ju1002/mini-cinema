package com.kh.moving.event.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.moving.event.model.dto.EventDTO;
import com.kh.moving.event.model.service.ServiceEvent;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/event")
@RequiredArgsConstructor
//정보 조회 :GET
//데이터를 주고 받는것 :POST
public class EventController {
	@GetMapping
	public String eventPage() {
		// event\event_page
		//log.info("괜찮으셈?");
		return "event/event_page"; // 이벤트 페이지 반환
	}

	@GetMapping("/form")
	public String createEvent(EventDTO event) {
//		log.info("이벤트 {}",event);
		return "event/enroll_form"; //이벤트 등록 하는 페이지 반환
	}
	@PostMapping("/form")
	public String save(EventDTO event,MultipartFile upfile,HttpSession session) {
		
	ServiceEvent.save(event,upfile,session);
		
		
		
		
		//1.파일 존재 유무 
		//파일 존재 유무 체크 후 이름바꾸기 후 파일 업로드
		
		
		
		
		
		
		return "redirect:/event/enrll_form";
	}

}
