package com.kh.moving.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moving.event.model.dto.EventDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/event")
@Slf4j
@RequiredArgsConstructor
//정보 조회 :GET
//데이터를 주고 받는것 :POST
public class EventController {
	@GetMapping
	public String eventPage() {
		// event\event_page
		// log.info("괜찮으셈?");
		return "event/event_page"; // 이벤트 페이지 반환
	}

	@GetMapping("/form")
	public String createEvent(EventDTO event) {
		log.info("이벤트 추가 할꺼임 {}", event);
		return "event/enroll_form"; //이벤트 등록 하는 페이지 반환
	}

}
