package com.kh.moving.event.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.moving.event.model.dto.EventDTO;



public interface ServiceEvent {
	
int insert(EventDTO event , HttpSession session);
List<EventDTO> selectAll(EventDTO event , HttpSession session);
	
}
