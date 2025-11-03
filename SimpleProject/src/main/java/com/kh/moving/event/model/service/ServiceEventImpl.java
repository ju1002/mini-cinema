package com.kh.moving.event.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.moving.event.model.dao.EventDAO;
import com.kh.moving.event.model.dto.EventDTO;
import com.kh.moving.exception.AuthenticationException;
import com.kh.moving.exception.InvalidArgumentsException;
import com.kh.moving.member.model.dto.MemberDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ServiceEventImpl implements ServiceEvent {
	
	private final EventDAO eventDao;
	
	/**
	 * 매니저 권한 검증
	 */
	private void validateManager(EventDTO event, HttpSession session) {
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		
		if (loginMember == null || !"Y".equals(loginMember.getManager())) {
			throw new AuthenticationException("권한 없는 접근입니다.");
		}
	}
	
	/**
	 * 이벤트 내용 검증
	 */
	private void validateContent(EventDTO event) {
		if (event.getEventTitle() == null || event.getEventTitle().trim().isEmpty() ||
		    event.getDescription() == null || event.getDescription().trim().isEmpty()) {
			throw new InvalidArgumentsException("유효하지 않는 요청입니다.");
		}
	}
	
	
	@Override
	public int insert (EventDTO event, HttpSession session) {
		try {
			// 1. 권한 검증
			validateManager(event, session);
			log.info("권한 검증 완료");
			
			// 2. 유효성 검증
			validateContent(event);
			log.info("유효성 검증 완료");
			
			MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
			if (loginMember == null) {
			    log.error("로그인 정보가 없습니다.");
			} else {
			    log.info("현재 로그인 회원: {}", loginMember);
			    log.info("현재 로그인 회원번호: {}", loginMember.getUserNo());
			}
			
			event.setUserNo(loginMember.getUserNo());
	        log.info("이벤트 작성자 번호: {}", event.getUserNo());
			
			// 3. DB에 저장
			int result = eventDao.insert(event);
			log.info("이벤트 저장 결과: {}", result);
			
			return result;
			
		} catch (AuthenticationException | InvalidArgumentsException e) {
			log.warn("검증 실패: {}", e.getMessage());
			throw e;
		} catch (Exception e) {
			log.error("이벤트 저장 중 예상치 못한 에러 발생", e);
			throw new RuntimeException("이벤트 저장 실패", e);
		}
	}
	@Override
	public void selectAll(EventDTO event , HttpSession session){
		if()
		return ;
	}
}

