package com.kh.moving.event.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.moving.event.model.dto.EventDTO;

@Mapper
public interface EventDAO {
	@Insert("INSERT INTO TB_EVENT (EVENT_NO ,EVENT_TITLE,START_DATE,END_DATE,POST_ORIGIN_NAME,STATUS,DESCRIPTION)"+ "VALUES(SEQ_EVNET_NO.NEXTVAL ,#{evnetTitle},SYSDATE,SYSDATE,#{postOriginName},#{ description},DEFAULT)")
	int save(EventDTO event);


}
