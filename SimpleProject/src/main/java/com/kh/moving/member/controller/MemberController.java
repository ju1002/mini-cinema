package com.kh.moving.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
    
    @RequestMapping("/")
    public String main() {
        return "main";
    }
    
  
}