package com.kh.moving.member.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.moving.member.model.dto.MemberDTO;
import com.kh.moving.member.model.dto.MemberGenreDTO;

public interface MemberService {
	
	MemberDTO login(String loginGb, MemberDTO member);

	List<MemberGenreDTO> loginGenre(MemberDTO member);

	int signUp(MemberDTO member);

	int update(MemberDTO member, HttpSession session);

	int delete(String userPwd, HttpSession session);
	
}
