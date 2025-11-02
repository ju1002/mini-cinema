package com.kh.moving.member.model.service;

import org.springframework.stereotype.Component;

import com.kh.moving.exception.AuthenticationException;
import com.kh.moving.exception.InvalidArgumentsException;
import com.kh.moving.exception.TooLargeValueException;
import com.kh.moving.member.model.dao.MemberMapper;
import com.kh.moving.member.model.dto.MemberDTO;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MemberValidator {
	
	private final MemberMapper memberMapper;
	
	private void checkNull(MemberDTO member) {
		if(member == null) {
			throw new NullPointerException("잘못된 접근입니다.");
		}
	}
	private void checkLength(MemberDTO member) {
		if(member.getUserId().length() > 20) {
			throw new TooLargeValueException("아이디 값이 너무 길어용");
		}
	}
	private void checkBlank(MemberDTO member) {
		if(member.getUserId() == null ||
				member.getUserId().trim().isEmpty() ||
				member.getUserPwd() == null ||
				member.getUserPwd().trim().isEmpty()) {
			throw new InvalidArgumentsException("유효하지 않은 값입니다.");
		}
	}
	
	public void validatedMember(MemberDTO member) {
		checkNull(member);
		checkLength(member);
		checkBlank(member);
	}
	
	public void validatedUpdateMember(MemberDTO member, MemberDTO sessionMember) {
		checkNull(member);
		checkNull(sessionMember);
		
		if(!member.getUserId().equals(sessionMember.getUserId())) {
			throw new AuthenticationException("권한없는 접근입니다.");
		}
		
		checkNull(memberMapper.login(member));
	}
}
