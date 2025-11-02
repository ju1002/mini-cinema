package com.kh.moving.notice.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.moving.member.model.dto.MemberDTO;
import com.kh.moving.notice.model.dto.NoticeDTO;
import com.kh.moving.notice.model.mapper.NoticeMapper;
import com.kh.moving.utll.PageInfo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeMapper noticeMapper;
	
	@Override
	public int getNoticeCount() {
		return noticeMapper.countNotice();
	}

	@Override
	public List<NoticeDTO> findAllNotice(PageInfo pageInfo) {
		int startRow = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit() + 1;
        int endRow = startRow + pageInfo.getBoardLimit() - 1;

        return noticeMapper.findAllNotice(startRow, endRow);
	}

	@Override
	public int save(NoticeDTO noticeDTO, HttpSession session) {
		
		// 검증된(관리자만 게시글 작성)
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		
		// 로그인 된 상태인지확인하기 
		if(loginMember == null) {
			return 0;
		}
		
		// 관리자만 게시글이 작성이 가능해야함 
		// 관리자는 Member테이블에 MANAGER가 Y인 유 
		if(!"Y".equals(loginMember.getManager())) {
			return 0;
		}
		
		// 로그인 된 상태 / 관리자만 
		noticeDTO.setUserNo(loginMember.getUserNo());
		
		noticeDTO.setUserName(loginMember.getUserName());
		
		int result = noticeMapper.insertNotice(noticeDTO);
		
		return result;
	}

	@Override
	public int noticeViews(int noticeId) {
		
		return noticeMapper.noticeViews(noticeId);
		
	}

	@Override
	public NoticeDTO findNoticeById(int noticeId) {
		return noticeMapper.findNoticeById(noticeId);
	}

	@Override
	public int updateNotice(NoticeDTO noticeDTO, int userNo) {
		
		noticeDTO.setUserNo(userNo);
		
		return noticeMapper.updateNotice(noticeDTO);
	}
	
	
	
	
	
	
	
	

}
