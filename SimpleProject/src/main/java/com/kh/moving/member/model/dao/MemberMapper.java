package com.kh.moving.member.model.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.moving.member.model.dto.MemberDTO;
import com.kh.moving.member.model.dto.MemberGenreDTO;

@Mapper
public interface MemberMapper {
	
	@Select("SELECT USER_ID userId, USER_PWD userPwd, USER_NAME userName, BIRTHDAY, PHONE, EMAIL, ENROLL_DATE enrollDate, SNS_AGREE snsAgree,  ENROLL_DATE, MANAGER, STATUS FROM TB_MEMBER WHERE USER_ID = #{userId}")
	MemberDTO login(MemberDTO member);
	
	@Insert("INSERT INTO TB_MEMBER(USER_NO, USER_ID, USER_PWD, USER_NAME, BIRTHDAY, PHONE, EMAIL, SNS_AGREE) VALUES (SEQ_USERNO.NEXTVAL, #{userId}, #{userPwd}, #{userName}, #{birthday}, #{phone}, #{email}, #{snsAgree})")

	int signup(MemberDTO member);

	@Insert("INSERT INTO TB_MEMBER_GENRE(USER_NO, GENRE_ID) VALUES (#{userNo}, #{genreId})")
	int signup2(MemberGenreDTO genre);
	
	@Update("UPDATE TB_MEMBER SET USER_NAME = #{userName}, BIRTHDAY = #{birthday}, PHONE = #{phone}, EMAIL = #{email}, SNS_AGREE = #{snsAgree} WHERE USER_ID = #{userId}")

	int update(MemberDTO member);
	
	@Delete("DELETE FROM TB_MEMBER WHERE USER_ID = #{ userId }")
	int delete(String userId);
	
}
