package com.kh.moving.notice.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.moving.member.model.dto.MemberDTO;
import com.kh.moving.notice.model.dto.NoticeDTO;
import com.kh.moving.utll.PageInfo;

public interface NoticeService {

	// 게시글 전체 개수 조회 
	int getNoticeCount();
	
	// 게시글 담기(전체 조회해서 조회된 결과를 리스트로 담기)
	List<NoticeDTO> findAllNotice(PageInfo pageInfo);
	
	// 게시글 등록 
	int save(NoticeDTO noticeDTO, HttpSession session);

	// 게시글 목록에서 	조회수 증가 
	int noticeViews(int noticeId);

	NoticeDTO findNoticeById(int noticeId);

	int updateNotice(NoticeDTO noticeDTO, int userNo);

	int deleteNotice(int noticeNo, MemberDTO loginMember);
	
}