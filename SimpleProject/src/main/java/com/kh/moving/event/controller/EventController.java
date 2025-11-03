package com.kh.moving.event.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	 * 이벤트 목록 페이지
	 * GET /event
	 */
	@GetMapping
	public String eventPage() {
		log.info("이벤트 페이지 요청");
		return "event/event_page";
	}
	
	/**
	 * 이벤트 등록 폼 페이지
	 * GET /event/form
	 */
	@GetMapping("/form")
	public String createEvent(EventDTO event) {
		log.info("이벤트 등록 폼 페이지 요청");
		return "event/enroll_form";
	}
	
	/**
	 * 이벤트 저장
	 * POST /event/insert
	 */
	@PostMapping("/insert")
	public String save(EventDTO event,
	                    @RequestParam(name="file", required=false) MultipartFile file,
	                    HttpSession session) {
		try {
			log.info("이벤트 저장 요청: {}", event);
			
			// 서비스 호출 (파일 처리 + DB 저장)
			int result = serviceEvent.save(event, file, session);
			
			// 결과 처리
			if (result > 0) {
				log.info("이벤트 등록 성공: {}", result);
				return "redirect:/event";  // ✅ 이벤트 목록 페이지로 리다이렉트
			} else {
				log.error("이벤트 등록 실패: {}", result);
				return "event/enroll_form";
			}
			
		} catch (Exception e) {
			log.error("이벤트 저장 중 에러 발생", e);
			return "event/enroll_form";
		}
	}
}


/* 
========================================
변경 사항 정리
========================================

1. ✅ int result = serviceEvent.save(...) 추가
   - 반환값으로 저장 성공/실패 확인

2. ✅ if(result > 0) 추가
   - 성공: redirect:/event (이벤트 목록 페이지)
   - 실패: event/enroll_form (등록 폼으로 돌아감)

3. ✅ try-catch 추가
   - 예외 발생 시 안전하게 처리

4. ✅ return "redirect:/event" 추가
   - 성공 시 이벤트 목록 페이지로 이동
   - 사용자가 등록된 이벤트를 바로 볼 수 있음

5. ✅ 주석 추가
   - 각 메서드의 역할 명확히
*/