package com.kh.moving.member.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.moving.exception.AuthenticationException;
import com.kh.moving.member.model.dao.MemberMapper;
import com.kh.moving.member.model.dto.MemberDTO;
import com.moving.exception.UserIdNotFoundException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final PasswordEncoder passwordEncoder;
	private final MemberValidator validator;
	private final MemberMapper mapper;
	
	@Override
	public MemberDTO login(MemberDTO member) {
		
		MemberDTO loginMember = mapper.login(member);
		return validateLoginMember(loginMember, member.getUserPwd());
	}
	
	private MemberDTO validateLoginMember(MemberDTO loginMember, String userPwd) {
		if(loginMember == null) {
			throw new UserIdNotFoundException("아이디 또는 비밀번호가 올바르지 않습니다.");
		}
		if(passwordEncoder.matches(userPwd, loginMember.getUserPwd())) {
			return loginMember;
		}
		return null;
	}
	
	@Override
	public void signUp(MemberDTO member) {
		
		validator.validatedMember(member);
		String encPwd = passwordEncoder.encode(member.getUserPwd());
		member.setUserPwd(encPwd);
		mapper.signup(member);
	}
	
	@Override
	public void update(MemberDTO member, HttpSession session) {
		
		MemberDTO sessionMember = ((MemberDTO)session.getAttribute("loginMember"));
		
		validator.validatedUpdateMember(member, sessionMember);
		
		int result = mapper.update(member);
		
		if(result != 1) {
			throw new AuthenticationException("문제가 발생했습니다. 관리자에게 문의하세요.");
		}
		
		sessionMember.setUserName(member.getUserName());
		sessionMember.setBirthday(member.getBirthday());
		sessionMember.setPhone(member.getPhone());
		sessionMember.setEmail(member.getEmail());
		sessionMember.setSnsAgree(member.getSnsAgree());
	}
	
	@Override
	public void delete(String userPwd, HttpSession session) {
		
		MemberDTO sessionMember = ((MemberDTO)session.getAttribute("loginMember"));
		
		if(sessionMember == null) {
			throw new AuthenticationException("로그인부터 해라~");
		}
		
		if(!passwordEncoder.matches(userPwd, sessionMember.getUserPwd())) {
			throw new AuthenticationException("비밀번호가 일치하지 않습니다.");
		}
		
		int result = mapper.delete(sessionMember.getUserId());
		
		if(result != 1) {
			throw new AuthenticationException("관리자에게 문의하세요.");
		}
	}
}
