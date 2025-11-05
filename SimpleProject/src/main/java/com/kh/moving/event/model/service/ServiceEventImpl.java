package com.kh.moving.event.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
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
	private final EventDTO eventDto;
	private final HttpSession session;

	/**
	 *  권한 검증
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
		if (event.getEventTitle() == null || event.getEventTitle().trim().isEmpty() || event.getDescription() == null
				|| event.getDescription().trim().isEmpty()) {
			throw new InvalidArgumentsException("유효하지 않는 요청입니다.");
		}
	}

	@Override
	public int insert(EventDTO event, HttpSession session) {
		validateManager(event, session);
		log.info("권한 검증 완료");

		validateContent(event);
		log.info("유효성 검증 완료");

		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		if (loginMember == null) {
			throw new AuthenticationException("로그인 정보가 없습니다.");
		}

		log.info("현재 로그인 회원: {}", loginMember);
		log.info("현재 로그인 회원번호: {}", loginMember.getUserNo());

		event.setUserNo(loginMember.getUserNo());
		log.info("이벤트 작성자 번호: {}", event.getUserNo());

		int result = eventDao.insert(event);
		log.info("이벤트 저장 결과: {}", result);

		return result;
	}

	@Override
	public int totalCount() {
		return eventDao.totalCount();
	}

	@Override
	public List<EventDTO> findAll(int pageNo) {
		if (pageNo < 1) {
			throw new InvalidArgumentsException("유효하지 않는 페이지 번호입니다.");
		}

		RowBounds rb = new RowBounds((pageNo - 1) * 5, 5);
		List<EventDTO> events = eventDao.findAll(rb);

		return events;
	}

	@Override
	public int delete(int eventNo) {
		if (eventNo < 0) {
			throw new InvalidArgumentsException("유효하지 않은 이벤트 번호입니다.");
		}

		int result = eventDao.delete(eventNo);

		return result;
	}
	@Override
	public int update(int eventNo,int userNo) {
		
		
		validateManager(eventDto, session);
		validateContent(eventDto);
		InvalidArgumentsException("업데이트를 할 수 없습니다.");
		int result=eventDao.update(eventNo, userNo);
		return result;
		
	}
	@Override
	public List<EventDTO> detail(int eventNo){
		if(eventNo == null || eventNo !=eventDto.getEventNo()) {
			throw new InvalidArgumentsException("유효하지 않은 이벤트 입니다.");
			
		}
		List<EventDTO> event = eventDao.detail(eventNo);
		return event;
	}
}