package com.kh.moving.event.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.kh.moving.event.model.dto.EventDTO;



public interface ServiceEvent {
	
int save(EventDTO event , MultipartFile file, HttpSession session);
	
}
