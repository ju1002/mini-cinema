package com.kh.moving.event.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	private final Pagenation pagenation;
	

	/**
	 * 이벤트 목록 페이지 GET /event
	 */
	@GetMapping
	public String eventPage(Model model) {
	    log.info("이벤트 페이지 요청");
	    return "redirect:/event/inventory?page=1";
	}

	//이벤트 등록 매핑
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
				return "redirect:/event/inventory?page=1";
			} else {
				log.error("이벤트 등록 실패: {}", result);
				return "event/enroll_form";
			}

		} catch (Exception e) {
			log.error("이벤트 저장 중 에러 발생", e);
			return "event/enroll_form";
		}
	}
	
	//전체 목록 조회
	@GetMapping("/inventory")
	public String findAll(@RequestParam(name="page",defaultValue="1") int  pageNo,Model model) {
//		log.info("페이지 값:{}",pageNo);
//		model을 사용하여 Spring에서 뷰로  데이터를 전달한다.
		
		//전체 이벤트 개수 조회
		int listCount = serviceEvent.totalCount();
		//이벤트 목록 조회
		List<EventDTO> events =serviceEvent.findAll(pageNo);
		
		
		
		PageInfo pageInfo =pagenation.getPageInfo(listCount, pageNo, 5, 3);
				
		model.addAttribute("events",events); //이벤트 목록 전달
		model.addAttribute(("pageInfo"),pageInfo);
		if(events!=null) {
			log.info("이벤트 목록 페이지 성공{}" ,events);
			
		}else {
			log.info("이벤트 목록 페이지 실패{}",events);
			
		}
		
		return "event/event_page";
	
	}
		
	@PostMapping("/deleteEvent")
	public String deleteEvent(@RequestParam(value="eventNo") int eventNo) {
		
		int result = serviceEvent.delete(eventNo);
		
		if(result >0) {
			log.info("이벤트 삭제에 성공하셨습니다.");
		}
		
		
		return "redirect:/event/inventory?page=1";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	
	