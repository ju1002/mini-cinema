package com.kh.moving.event.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.moving.event.model.dto.EventDTO;

@Mapper
public interface EventDAO {
    @Insert("INSERT INTO TB_EVENT (EVENT_NO, EVENT_TITLE, DESCRIPTION, START_DATE, END_DATE, STATUS, USER_NO) " +
            "VALUES(TB_EVENT_SEQ_UNO.NEXTVAL, #{eventTitle}, #{description}, SYSDATE, SYSDATE, DEFAULT, #{userNo})")
    int insert(EventDTO event);
    
    @Select("SELECT COUNT(*) FROM TB_EVENT WHERE STATUS='Y'")
    int totalCount();
    
    
    @Select("SELECT EVENT_NO eventNo ,EVENT_TITLE eventTitle ,DESCRIPTION description ,START_DATE startDate,END_DATE endDate, STATUS, USER_NO userNo FROM TB_EVENT WHERE STATUS='Y'")
    	List<EventDTO> findAll(RowBounds rb); 
    @Delete("DELETE FROM TB_EVENT WHERE EVENT_NO = #{eventNo}")
    	int delete(int eventNo);
    
}
