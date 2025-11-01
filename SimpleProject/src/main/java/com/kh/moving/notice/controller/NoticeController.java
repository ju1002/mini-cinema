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
    	
    	model.addAttribute("noticeList", noticeList); // 공지사항 목록 전달
        model.addAttribute("pageInfo", pageInfo);
    	
    	return "notice/notice_List";
    }
    
    @RequestMapping("/noticeDetail")
    public String noticeDetail(@RequestParam("noticeId") int noticeId, Model model) {
        return "notice/notice_Detail";
    }
	
	// 비동기 방식 시작
	
	/*
	 * 공지사항 목록을 반환 받기 
	 */
	
	/*
	@GetMapping("/noticeList")
	public String noticeListPage() {
		// log.info("공지사항 목록 반환");
		return "notice/notice_List";
	}
	
	// 공지사항 목록을 AJAX요청으로 비동기 방식으로 받
	@GetMapping(value = "/list/data", produces = "application/json; charset=UTF-8")
	@ResponseBody
    public String getNoticeList(@RequestParam(value="page", defaultValue="1") int currentPage) {
    	
		// log.info("AJAX 요청 오는지 확인 : {} ", currentPage);
		
		int listCount = noticeService.getNoticeCount();
		PageInfo pageInfo = pagenation.getPageInfo(listCount, currentPage, 10, 5);
		List<NoticeDTO> noticeList = noticeService.findAllNotice(pageInfo);
		
		JsonObject resposneData = new JsonObject();
		JsonArray noticeListArray = new JsonArray();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		
		
		return null;
    }
    */
    
    // 페이징 처리 끝(게시글 목록 조회)
    
    // 게시글 글쓰기 
    // 권한은 관리자 status = Y인 사람한테만 권한주기 
    
    
    
    
}
