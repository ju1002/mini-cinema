package com.kh.moving.event.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.moving.event.model.dto.EventDTO;

@Mapper
public interface EventDAO {
    @Insert("INSERT INTO TB_EVENT (EVENT_NO, EVENT_TITLE, DESCRIPTION, START_DATE, END_DATE, STATUS, USER_NO) " +
            "VALUES(TB_EVENT_SEQ_UNO.NEXTVAL, #{eventTitle}, #{description}, SYSDATE, SYSDATE, DEFAULT, #{userNo})")
    int insert(EventDTO event);
}
