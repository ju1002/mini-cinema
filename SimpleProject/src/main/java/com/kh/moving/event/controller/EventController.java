package com.kh.moving.event.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moving.event.model.dto.EventDTO;
import com.kh.moving.event.model.service.ServiceEvent;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/event")
@RequiredArgsConstructor
public class EventController {

	private final ServiceEvent serviceEvent;

	/**
	 * 이벤트 목록 페이지 GET /event
	 */
	@GetMapping
	public String eventPage() {
		log.info("이벤트 페이지 요청");
		return "event/event_page";
	}

	/**
	 * 이벤트 등록 폼 페이지 GET /event/form
	 */
	@GetMapping("/form")
	public String createEvent(EventDTO event) {

		return "event/enroll_form";
	}

	/**
	 * 이벤트 저장 POST /event/insert
	 */
	@PostMapping("/insert")
	public String insert(EventDTO event,HttpSession session) {
		try {
			log.info("이벤트 저장 요청: {}", event);

			// 서비스 호출 (파일 처리 + DB 저장)
			int result = serviceEvent.insert(event, session);

			// 결과 처리
			if (result > 0) {
				log.info("이벤트 등록 성공: {}", result);
				return "/event/enroll_form";
			} else {
				log.error("이벤트 등록 실패: {}", result);
				return "event/enroll_form";
			}

		} catch (Exception e) {
			log.error("이벤트 저장 중 에러 발생", e);
			return "event/enroll_form";
		}
	}
	@GetMapping("/select")
	public void select(EventDTO event,HttpSession session) {
		log.info("이벤트 전체 조회:{}",event);
		serviceEvent.selectAll(event,session);
		return;
	}
}
