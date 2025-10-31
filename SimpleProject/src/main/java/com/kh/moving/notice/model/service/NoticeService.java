package com.kh.moving.notice.model.service;

import java.util.List;

import com.kh.moving.notice.model.dto.NoticeDTO;
import com.kh.moving.utll.PageInfo;

public interface NoticeService {

	int getNoticeCount();
	
	List<NoticeDTO> findAllNotice(PageInfo pageInfo);
	
}
