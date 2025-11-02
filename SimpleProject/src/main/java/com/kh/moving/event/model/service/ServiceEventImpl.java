package com.kh.moving.event.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.moving.event.model.dao.EventDAO;
import com.kh.moving.event.model.dto.EventDTO;
import com.kh.moving.exception.AuthenticationException;
import com.kh.moving.exception.InvalidArgumentsException;
import com.kh.moving.member.model.dto.MemberDTO;



@Service
public class ServiceEventImpl implements ServiceEvent {
	
	private void validateManager( EventDTO event , HttpSession session){
		MemberDTO loginMember = ((MemberDTO)session.getAttribute("loginMember"));
		
		if(loginMember==null|| !"Y".equals(loginMember.getManager())) {
			throw new AuthenticationException("권한 없는 접근입니다.");
		}
	}
	private void validateContent(EventDTO event) {
		if(event.getEventTitle().tirm().isEmpty()||
			    event.getEventDescription().trim().isEmpty()) {
				throw new InvalidArgumentsException("유효하지 않는 요청입니다.");
			}
	}
	@Override
	public int save(EventDTO event , MultipartFile upfile, HttpSession session) {
		//1번 권한 검증 
		validateManager(event,session);
		
		//2번 유효성 검증 
		validateContent(event);
		//3번 파일이 있을 경우 업로드
		StringBuilder sb = new StringBuilder();
		sb.append("Event_");
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		sb.append("_");
		int num = (int)(Math.random()*900)+100;
		sb.append(num);
		String ext = upfile.getOriginalFilename()
						   .substring(upfile.getOriginalFilename().lastIndexOf("."));
		sb.append(ext);
			
		
		ServletContext application = session.getServletContext();
		String savePath = application.getRealPath("/resources/files/");
		
		try {
			upfile.transferTo(new File(savePath + sb.toString()));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		event.setPostOriginName(upfile.getPostOriginName());
		event.setChangeName("moving/resources/event/"+sb.toString());
		
		EventDAO.save(event);
		return 0;	
	}

}
