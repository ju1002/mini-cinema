package com.kh.moving.member.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.moving.exception.AuthenticationException;
import com.kh.moving.member.model.dao.MemberMapper;
import com.kh.moving.member.model.dto.MemberDTO;
import com.kh.moving.member.model.dto.MemberGenreDTO;
import com.kh.moving.exception.UserIdNotFoundException;

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
	public MemberDTO login(String loginGb, MemberDTO member) {
		
		MemberDTO loginMember = mapper.login(member);
		
		return validateLoginMember(loginGb, loginMember, member.getUserPwd());
	}
	
	@Override
	public List<MemberGenreDTO> loginGenre(MemberDTO member) {
		
		List<MemberGenreDTO> loginGenre = mapper.loginGenre(member);
		return loginGenre;
	}
	
	private MemberDTO validateLoginMember(String loginGb, MemberDTO loginMember, String userPwd) {
		if(loginMember == null) {
			throw new UserIdNotFoundException("회원정보가 존재하지 않습니다.");
		}
		
		if("L".equals(loginGb)) {
			if(passwordEncoder.matches(userPwd, loginMember.getUserPwd())) {
				return loginMember;
			} else {
				throw new UserIdNotFoundException("아이디 또는 비밀번호가 올바르지 않습니다.");
			}
		} else {
			return loginMember;
		}
	}
	
	@Override
	public int signUp(MemberDTO member) {
		
		validator.validatedMember(member);
		
		int userNo = mapper.getseqUserNo(member);
		String encPwd = passwordEncoder.encode(member.getUserPwd());
		
		member.setUserNo(userNo);
		member.setUserPwd(encPwd);

		int result = mapper.signup(member);
		
		if(result != 1) {
			throw new AuthenticationException("문제가 발생했습니다. 관리자에게 문의하세요.");
		}
		
		String[] test = null;
		MemberGenreDTO genre = new MemberGenreDTO();
		
		String pre = member.getPreferredGenres();
		test = pre.split(",");
		
		genre.setUserNo(userNo);

		
		int result2 = 0;
		for(int i=0; i<test.length; i++) {
			genre.setGenreId(test[i]);
			
			result2 = mapper.signup2(genre);

			if(result2 != 1) {
				throw new AuthenticationException("문제가 발생했습니다. 관리자에게 문의하세요.");
			}
		}
		return result;
	}
	
	@Override
	public int update(MemberDTO member, HttpSession session) {

		MemberDTO sessionMember = ((MemberDTO)session.getAttribute("loginMember"));
		
		validator.validatedUpdateMember(member, sessionMember);
		

		int userNo = member.getUserNo();
		int result = mapper.update(member);
		
		if(result != 1) {
			throw new AuthenticationException("문제가 발생했습니다. 관리자에게 문의하세요.");
		}
		
		String[] test = null;
		String pre = member.getPreferredGenres();
		MemberGenreDTO genre = new MemberGenreDTO();
		
		test = pre.split(",");
		
		int result2 = 0;
		mapper.delete2(userNo);
		
		genre.setUserNo(userNo);
		for(int i=0; i<test.length; i++) {
			genre.setGenreId(test[i]);
			
			result2 = mapper.signup2(genre);
			if(result2 != 1) {
				throw new AuthenticationException("문제가 발생했습니다. 관리자에게 문의하세요.");
			}
		}

		sessionMember.setUserName(member.getUserName());
		sessionMember.setBirthday(member.getBirthday());
		sessionMember.setPhone(member.getPhone());
		sessionMember.setEmail(member.getEmail());
		sessionMember.setSnsAgree(member.getSnsAgree());
		sessionMember.setSnsAgree(member.getPreferredGenres());
		
		return result;
	}
	
	@Override
	public int delete(String userPwd, HttpSession session) {
		
		MemberDTO sessionMember = ((MemberDTO)session.getAttribute("loginMember"));
		
		if(sessionMember == null) {
			throw new AuthenticationException("로그인부터 해라~");
		}
		
		if(!passwordEncoder.matches(userPwd, sessionMember.getUserPwd())) {
			throw new AuthenticationException("비밀번호가 일치하지 않습니다.");
		}
		
		mapper.delete2(sessionMember.getUserNo());

		int result = mapper.delete(sessionMember.getUserId());
		
		if(result != 1) {
			throw new AuthenticationException("관리자에게 문의하세요.");
		}

		return result;

	}
}
