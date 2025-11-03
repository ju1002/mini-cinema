package com.kh.moving.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.moving.member.model.dto.MemberDTO;
import com.kh.moving.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
    
	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@PostMapping("/login")
	public ModelAndView login(MemberDTO member,
							  HttpSession session,
							  ModelAndView mv) {
		
		MemberDTO loginMember = memberService.login("L", member);
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("msg", "로그인실패!")
			  .setViewName("include/error_page");
		}
		return mv;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:/";
	}
	
	@GetMapping("join")
	public String joinForm() {
		
		return "member/signup";
	}
	
	@PostMapping("signup")

	public String signup(MemberDTO member,
            @RequestParam(value = "genreList", required = false) String[] genreList) {
		
		if (genreList != null && genreList.length > 0) {
	        String joinedGenres = String.join(",", genreList);
	        member.setPreferredGenres(joinedGenres);
	        log.info("선호 장르: {}", joinedGenres);
	    } else {
	        member.setPreferredGenres("");
	    }

	    log.info("회원가입 정보: {}", member);

		memberService.signUp(member);
		

		return "main";
	}
	
	@GetMapping("myInfo")
	public String myPage() {
		return "member/myInfo";
	}
	
	@PostMapping("edit")
	public String edit(MemberDTO member,
	                   @RequestParam(value = "genreList", required = false) String[] genreList,
	                   HttpSession session,
	                   RedirectAttributes redirectAttributes) {

	    if (genreList != null && genreList.length > 0) {
	        member.setPreferredGenres(String.join(",", genreList));
	    } else {
	        member.setPreferredGenres("");
	    }

	    log.info("수정된 정보: {}", member);

	    int result = memberService.update(member, session);
	    
	    if (result > 0) {
	        // DB 최신 정보로 세션 갱신
	        MemberDTO updatedMember = memberService.login("U", member);
	        session.setAttribute("loginMember", updatedMember);
	        redirectAttributes.addFlashAttribute("msg", "회원 정보가 수정되었습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("msg", "회원 정보 수정에 실패했습니다.");
	    }

	    return "redirect:myInfo";
	}

	
	@PostMapping("delete")
	public String delete(@RequestParam(value="userPwd") String userPwd,
						HttpSession session) {
		
		memberService.delete(userPwd, session);
		session.removeAttribute("loginMember");
		return "redirect:/";
	}
	

    @RequestMapping("/")
    public String main() {
        return "main";
    }
    
  
}