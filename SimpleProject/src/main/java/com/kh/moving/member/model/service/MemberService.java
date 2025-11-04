package com.kh.moving.member.model.service;

import javax.servlet.http.HttpSession;

import com.kh.moving.member.model.dto.MemberDTO;

public interface MemberService {
	

	MemberDTO login(String loginGb, MemberDTO member);

	int signUp(MemberDTO member);

	int update(MemberDTO member, HttpSession session);

	int delete(String userPwd, HttpSession session);

	
	
	
}

