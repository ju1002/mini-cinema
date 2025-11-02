package com.kh.moving.notice.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.moving.member.model.dto.MemberDTO;
import com.kh.moving.notice.model.dto.NoticeDTO;

@Mapper
public interface NoticeMapper {

	int countNotice(); 
	
	 List<NoticeDTO> findAllNotice(@Param("startRow") int startRow,
             @Param("endRow") int endRow);

	 // 게시글 작성 
	 int insertNotice(NoticeDTO noticeDTO);

	 // 게시글 조회수 증가 
	 @Update("UPDATE TB_NOTICE SET COUNT = COUNT + 1 WHERE NOTICE_NO = #{noticeId}")
	 int noticeViews(int noticeId);

	 // 게시글 상세조회 서비스 
	 NoticeDTO findNoticeById(int noticeId);

	 // 게시글 수정 
	 @Update("UPDATE TB_NOTICE SET NOTICE_TITLE = #{noticeTitle}, NOTICE_CONTENT = #{noticeContent} WHERE NOTICE_NO = #{noticeNo} AND USER_NO = #{userNo}")
	 int updateNotice(NoticeDTO noticeDTO);

}
