package com.kh.moving.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

<<<<<<< HEAD
=======
import com.kh.moving.exception.UserIdNotFoundException;


>>>>>>> 4576a68d7fb704bf69de1d99e73503c1fc196698
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
							  HttpServletResponse response,
							  Object handler) throws Exception  {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginMember") != null) {
			return true;
		} else {
<<<<<<< HEAD
			response.sendRedirect(request.getContextPath());
			return false;
=======
			throw new UserIdNotFoundException("로그인부터해주세요");
			
>>>>>>> 4576a68d7fb704bf69de1d99e73503c1fc196698
		}
	}
}
