package com.kh.moving.event.model.service;

import java.security.InvalidParameterException;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import com.kh.moving.event.model.dao.EventDAO;
import com.kh.moving.event.model.dto.EventDTO;
import com.kh.moving.exception.*;
import com.kh.moving.member.model.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ServiceEventImpl implements ServiceEvent {
	
	private final EventDAO eventDao;

	/** 
	 * 매니저 권한 확인
	 */
	private void validateManager(EventDTO event, HttpSession session) {
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		
		if (loginMember == null || !"Y".equals(loginMember.getManager())) {
			throw new AuthenticationException("권한 없는 접근입니다.");
		}
	}

	/** 
	 * 이벤트 제목/내용 유효성 검사
	 */
	private void validateContent(EventDTO event) {
		if (event.getEventTitle() == null || event.getEventTitle().trim().isEmpty() ||
		    event.getDescription() == null || event.getDescription().trim().isEmpty()) {
			throw new InvalidArgumentsException("이벤트 제목 또는 내용이 비어있습니다.");
		}
	}

	/**
	 * 이벤트 등록
	 */
	@Override
	public int insert(EventDTO event, HttpSession session) {
		try {
			validateManager(event, session);  // 권한 체크
			validateContent(event);           // 내용 체크
			
			MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
			event.setUserNo(loginMember.getUserNo()); // 작성자 정보 입력
			
			int result = eventDao.insert(event);
			log.info("이벤트 저장 결과: {}", result);
			
			return result;
			
		} catch (Exception e) {
			log.error("이벤트 저장 중 오류 발생", e);
			throw new RuntimeException("이벤트 저장 실패", e);
		}
	}

	/** 전체 이벤트 개수 조회 */
	@Override
	public int totalCount() {
		return eventDao.totalCount();
	}

	/** 페이징된 이벤트 목록 조회 */
	@Override
	public List<EventDTO> findAll(int pageNo) {
		if (pageNo < 1) throw new InvalidParameterException("잘못된 페이지 번호입니다.");
		RowBounds rb = new RowBounds((pageNo - 1) * 5, 5);
		return eventDao.findAll(rb);
	}

	/** 이벤트 삭제 */
	@Override
	public int delete(int eventNo) {
		if (eventNo < 0) throw new InvalidParameterException("잘못된 이벤트 번호입니다.");
		return eventDao.delete(eventNo);
	}

	/** 이벤트 상세 조회 */
	@Override
	public List<EventDTO> detail(int eventNo) {
		List<EventDTO> events = eventDao.detail(eventNo);
		
		if (events == null || events.isEmpty()) {
			throw new InvalidArgumentsException("존재하지 않는 이벤트입니다.");
		}
		return events;
	}
}
