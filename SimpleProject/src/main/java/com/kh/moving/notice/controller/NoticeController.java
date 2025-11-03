package com.kh.moving.notice.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moving.member.model.dto.MemberDTO;
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
	 * 상세조회 == noticeDetail 작성 == noticeInsert
	 */

	@GetMapping("/noticeList")
	public String findAll(@RequestParam(value = "page", defaultValue = "1") int currentPage, Model model) {

		int listCount = noticeService.getNoticeCount();

		PageInfo pageInfo = pagenation.getPageInfo(listCount, currentPage, 10, 5);

		List<NoticeDTO> noticeList = noticeService.findAllNotice(pageInfo);

		model.addAttribute("noticeList", noticeList); // 공지사항 목록 전달
		model.addAttribute("pageInfo", pageInfo);

		return "notice/notice_List";
	}

	// 비동기 방식 시작

	/*
	 * 공지사항 목록을 반환 받기
	 */

	/*
	 * @GetMapping("/noticeList") public String noticeListPage() { //
	 * log.info("공지사항 목록 반환"); return "notice/notice_List"; }
	 * 
	 * // 공지사항 목록을 AJAX요청으로 비동기 방식으로 받
	 * 
	 * @GetMapping(value = "/list/data", produces =
	 * "application/json; charset=UTF-8")
	 * 
	 * @ResponseBody public String getNoticeList(@RequestParam(value="page",
	 * defaultValue="1") int currentPage) {
	 * 
	 * // log.info("AJAX 요청 오는지 확인 : {} ", currentPage);
	 * 
	 * int listCount = noticeService.getNoticeCount(); PageInfo pageInfo =
	 * pagenation.getPageInfo(listCount, currentPage, 10, 5); List<NoticeDTO>
	 * noticeList = noticeService.findAllNotice(pageInfo);
	 * 
	 * JsonObject resposneData = new JsonObject(); JsonArray noticeListArray = new
	 * JsonArray();
	 * 
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	 * 
	 * 
	 * 
	 * return null; }
	 * 
	 * 추후 보완과제
	 * 
	 */

	// 페이징 처리 끝(게시글 목록 조회)

	// 게시글 글쓰기 (끝)
	// 권한은 관리자 status = Y인 사람한테만 권한주기
	// 게시글 작성

	@GetMapping("/noticeForm")
	public String toForm() {

		return "notice/notice_Form";
	}

	// NoticeController.java (수정안)

	@PostMapping("/noticeInsert")
	public String insertNotice(NoticeDTO noticeDTO, HttpSession session, Model model) {

	    // 1. 세션에서 로그인된 멤버(관리자) 정보 가져오기
	    MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

	    // 2. 관리자 정보가 유효한지 확인 (권한 체크 및 필수 검증)
	    if (loginMember == null || loginMember.getManager().equals("N")) {
	        // 관리자가 아니거나 세션이 만료된 경우 처리
	        model.addAttribute("errorMessage", "공지사항 작성 권한이 없습니다.");
	        return "redirect:/"; // 메인 페이지 등으로 리다이렉트
	    }
	    
	    noticeDTO.setUserNo(loginMember.getUserNo());   // 작성자 회원 번호 설정
	    noticeDTO.setUserName(loginMember.getUserName()); // 작성자 이름 설정 (예시: 관리자앙)

	    // 4. 서비스 호출
	    int result = noticeService.save(noticeDTO, session); // (세션은 여기서 불필요할 수 있으므로, 서비스 로직에 따라 제거 가능)

	    if (result > 0) {
	        return "redirect:/notice/noticeList";
	    } else {
	        model.addAttribute("errorMessage", "공지사항 등록 실패~~");
	        return "notice/notice_Form";
	    }
	}

	// 게시글 목록 조회 (끝)
	// 게시글 작성 완료 (끝)
	// 게시글 상세조회
	// 게시글 보면 조회수 증가 로직
	// 관리자가 권한을 가진 유저만 게시글 수정이 가능함
	// 게시글 삭제 기능 (권한을 가진 유저만 )

	// 게시글 상세조회 시작

	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam(value = "noticeId", required = false) Integer noticeId, 
		    Model model) {

		// 서비스한테 공지사항 아이디를보내서 noticeViews로 결과 result에 담
		int result = noticeService.noticeViews(noticeId);
		
		if(result > 0) {
			NoticeDTO noticeDTO = noticeService.findNoticeById(noticeId);
			
			if (noticeDTO.getCreateDate() != null) {
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		        String formattedString = sdf.format(noticeDTO.getCreateDate());
		        noticeDTO.setFormattedDate(formattedString); 
		    } else {
		        noticeDTO.setFormattedDate("-"); 
		    }
			
			model.addAttribute("notice", noticeDTO);
			
		return "notice/notice_Detail";
		} else {
			model.addAttribute("errorMsg", "게시글 조회에 실패했습니다.");
			return "include/error_page";
		}
	}
	
	@GetMapping("/noticeUpdateForm")
	public String noticeUpdateForm(@RequestParam(value = "noticeId", required = false) Integer noticeId, 
		    HttpSession session, Model model) {
		MemberDTO loginMember = (MemberDTO)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			model.addAttribute("errorMsg", "로그인 후 이용 가능합니다 ");
			return "include/error_page";
		}
		
		if (noticeId == null) {
	        // noticeId가 null이면 상세 조회를 시도하지 않고 리다이렉트
	        model.addAttribute("errorMsg", "잘못된 접근입니다 (게시글 ID가 누락되었습니다).");
	        return "redirect:/notice/noticeList";
	    }
		
		NoticeDTO noticeDTO = noticeService.findNoticeById(noticeId);
		
		boolean isAuthor = loginMember.getUserNo() == noticeDTO.getUserNo(); 
	    boolean isAdmin = "Y".equals(loginMember.getManager());
	    
	    if(isAuthor || isAdmin) {
	    	model.addAttribute("notice", noticeDTO);
	    	return "notice/notice_Edit";
	    } else {
	    	model.addAttribute("errorMsg", "에러발생데스카 ");
	    	return "redirect:/notice/noticeDetail?noticeId=" + noticeId;
	    }
	}
	
	@PostMapping("/noticeUpdate")
	public String updateNotice(NoticeDTO noticeDTO, HttpSession session, Model model) {
		
		// 로그인 된 유저중 게시글 작성만글을수정가능 
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			model.addAttribute("errorMsg", "로그인 후 이동 가능 ");
			return "include/error_page";
		}
		
		int result = noticeService.updateNotice(noticeDTO, loginMember.getUserNo());
		
		if(result > 0) {
			return "redirect:/notice/noticeDetail?noticeId=" + noticeDTO.getNoticeNo();
		} else {
			model.addAttribute("errorMsg", "게시글 수정 권한이 없습니다.");
			return "include/error_page";
		}
	}
	
	@PostMapping("/noticeDelete")
	@ResponseBody
	public String deleteNotice(@RequestParam("noticeId") int noticeId, HttpSession session) {

	    MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

	    if (loginMember == null || !"Y".equals(loginMember.getManager())) {
	        return "권한이 없습니다.";
	    }

	    int result = noticeService.deleteNotice(noticeId, loginMember);

	    if (result > 0) {
	        return "삭제 성공";
	    } else {
	        return "삭제 실패";
	    }
	}
}