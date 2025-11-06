package com.kh.moving.event.model.dao;

import java.util.List;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.session.RowBounds;
import com.kh.moving.event.model.dto.EventDTO;

@Mapper
public interface EventDAO {
	
	// 이벤트 등록
	@Insert("""
		INSERT INTO TB_EVENT (EVENT_NO, EVENT_TITLE, DESCRIPTION, START_DATE, END_DATE, STATUS, USER_NO)
		VALUES (TB_EVENT_SEQ_UNO.NEXTVAL, #{eventTitle}, #{description}, SYSDATE, SYSDATE, DEFAULT, #{userNo})
	""")
	int insert(EventDTO event);
	
	// 전체 개수 조회 (삭제되지 않은 이벤트만)
	@Select("SELECT COUNT(*) FROM TB_EVENT WHERE STATUS='Y'")
	int totalCount();
	
	// 페이징된 이벤트 목록 조회
	@Select("""
		SELECT EVENT_NO eventNo, EVENT_TITLE eventTitle, DESCRIPTION description, 
		       START_DATE startDate, END_DATE endDate, STATUS, USER_NO userNo
		FROM TB_EVENT WHERE STATUS='Y'
	""")
	List<EventDTO> findAll(RowBounds rb);
	
	// 이벤트 삭제
	@Delete("DELETE FROM TB_EVENT WHERE EVENT_NO = #{eventNo}")
	int delete(int eventNo);
	
	// 이벤트 상세 조회
	@Select("""
		SELECT EVENT_NO eventNo, EVENT_TITLE eventTitle, DESCRIPTION description, 
		       START_DATE startDate, END_DATE endDate, STATUS, USER_NO userNo
		FROM TB_EVENT WHERE EVENT_NO = #{eventNo}
	""")
	List<EventDTO> detail(int eventNo);
}
