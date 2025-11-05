package com.kh.moving.event.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.kh.moving.event.model.dto.EventDTO;
import com.kh.moving.event.model.service.ServiceEvent;
import com.kh.moving.utll.PageInfo;
import com.kh.moving.utll.Pagenation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/event")
@RequiredArgsConstructor
public class EventController {

	private final ServiceEvent serviceEvent;
	
	/** 
	 * [GET] /event
	 * 이벤트 목록 첫 페이지로 리다이렉트
	 */
	@GetMapping
	public String eventPage(Model model) {
	    log.info("이벤트 페이지 요청");
	    return "redirect:/event/inventory?page=1";
	}
	
	/**
	 * [GET] /event/form
	 * 이벤트 등록 페이지로 이동
	 */
	@GetMapping("/form")
	public String createEvent(EventDTO event) {
		return "event/enroll_form";
	}
	
	/**
	 * [POST] /event/insert
	 * 이벤트 등록 처리 (폼에서 입력받은 데이터를 DB에 저장)
	 */
	@PostMapping("/insert")
	public String insert(EventDTO event, HttpSession session) {
		int result = serviceEvent.insert(event, session);
		
		if (result > 0) {
			log.info("이벤트 등록 성공!");
			return "redirect:/event/inventory?page=1";
		} else {
			log.error("이벤트 등록 실패");
			return "event/enroll_form";
		}
	}
	
	/**
	 * [GET] /event/inventory
	 * 전체 이벤트 목록 조회 + 페이징 처리
	 */
	@GetMapping("/inventory")
	public String findAll(@RequestParam(name="page", defaultValue="1") int pageNo, Model model) {
		int listCount = serviceEvent.totalCount(); // 전체 이벤트 개수
		List<EventDTO> events = serviceEvent.findAll(pageNo); // 이벤트 목록
		
		// 페이지 정보 생성 (페이지 번호, 최대 페이지 등)
		PageInfo pageInfo = new Pagenation().getPageInfo(listCount, pageNo, 5, 3);
		
		model.addAttribute("events", events);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("currentPage", pageNo);
		
		log.info("이벤트 목록 조회 결과: {}", events);
		
		return "event/event_page";
	}
	
	/**
	 * [POST] /event/deleteEvent
	 * 이벤트 삭제 처리
	 */
	@PostMapping("/deleteEvent")
	public String deleteEvent(@RequestParam(value="eventNo") int eventNo) {
		int result = serviceEvent.delete(eventNo);
		
		if (result > 0) {
			log.info("이벤트 삭제 성공");
		}
		return "redirect:/event/inventory?page=1";
	}
	
	/**
	 * [GET] /event/detailEvent
	 * 이벤트 상세 조회
	 */
	@GetMapping("/detailEvent")
	public String detailEvent(@RequestParam(value="eventNo") int eventNo, Model model) {
		List<EventDTO> events = serviceEvent.detail(eventNo);
		
		if (!events.isEmpty()) {
			model.addAttribute("event", events.get(0));
			log.info("이벤트 상세 보기 성공");
		} else {
			log.info("이벤트 상세 보기 실패");
		}
		
		return "event/detail";
	}
}
