package com.kh.moving.member.model.service;

import javax.servlet.http.HttpSession;

import com.kh.moving.member.model.dto.MemberDTO;

public interface MemberService {
	
	MemberDTO login(MemberDTO member);

	void signUp(MemberDTO member);

	void update(MemberDTO member, HttpSession session);

	void delete(String userPwd, HttpSession session);
	
}

