package com.kh.moving.notice.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.moving.notice.model.dto.NoticeDTO;

@Mapper
public interface NoticeMapper {

	int countNotice();
	
	 List<NoticeDTO> findAllNotice(@Param("startRow") int startRow,
             @Param("endRow") int endRow);

}
