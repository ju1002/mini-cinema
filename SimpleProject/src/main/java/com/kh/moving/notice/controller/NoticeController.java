package com.kh.moving.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.moving.notice.model.dto.NoticeDTO;
import com.kh.moving.notice.model.service.NoticeService;
import com.kh.moving.utll.PageInfo;
import com.kh.moving.utll.Pagenation;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("notice")
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService noticeService;
	private final Pagenation pagenation;
	
	/*
	 * mapping 
	 * 
	 * 전체조회 == noticeList
	 * 
	 * 상세조회 == noticeDetail
	 * 작성 == noticeInsert
	 */
    
    @GetMapping("/noticeList")
    public String findAll(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
        
    	int listCount = noticeService.getNoticeCount();
    	
    	 PageInfo pageInfo = pagenation.getPageInfo(listCount, currentPage, 10, 5);
    	
    	List<NoticeDTO> noticeList = noticeService.findAllNotice(pageInfo);
    	
    	return "notice/notice_List";
    }
    
    @RequestMapping("/noticeDetail")
    public String noticeDetail(@RequestParam("noticeId") int noticeId, Model model) {
        return "notice/notice_Detail";
    }
    
    
}
