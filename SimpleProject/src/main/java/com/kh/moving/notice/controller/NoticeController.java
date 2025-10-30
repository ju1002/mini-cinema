package com.kh.moving.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {
    
    @RequestMapping("/noticeList")
    public String noticeList(Model model) {
        return "notice/notice_List";
    }
    
    @RequestMapping("/noticeDetail")
    public String noticeDetail(@RequestParam("noticeId") int noticeId, Model model) {
        return "notice/notice_Detail";
    }
    
    
}
