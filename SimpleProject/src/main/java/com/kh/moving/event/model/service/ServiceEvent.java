package com.kh.moving.event.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.kh.moving.event.model.dto.EventDTO;



public interface ServiceEvent {
	
	int insert (EventDTO event, HttpSession session);
//전체 게시글 수 조회
	int totalCount();
//목록 조회
List<EventDTO> findAll(int pageNo);

//이벤트 삭제
int delete(int eventNo);

}
