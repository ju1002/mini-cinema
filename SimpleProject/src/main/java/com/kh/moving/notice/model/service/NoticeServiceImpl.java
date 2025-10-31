package com.kh.moving.notice.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

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

}
