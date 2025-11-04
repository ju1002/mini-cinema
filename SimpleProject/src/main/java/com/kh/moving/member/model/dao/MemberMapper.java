package com.kh.moving.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.moving.member.model.dto.MemberDTO;
import com.kh.moving.member.model.dto.MemberGenreDTO;

@Mapper
public interface MemberMapper {
	
	@Select("SELECT SEQ_USERNO.NEXTVAL FROM DUAL")
	int getseqUserNo(MemberDTO member);

	@Select("SELECT USER_NO userNo, USER_ID userId, USER_PWD userPwd, USER_NAME userName, BIRTHDAY, PHONE, EMAIL, ENROLL_DATE enrollDate, SNS_AGREE snsAgree, ENROLL_DATE, MANAGER, STATUS FROM TB_MEMBER MEM WHERE USER_ID = #{userId}")
	MemberDTO login(MemberDTO member);

	@Select("SELECT USER_NO userNo, GENRE_ID genreId FROM TB_MEMBER_GENRE GEN WHERE USER_NO = #{userNo}")
	List<MemberGenreDTO> loginGenre(MemberDTO member);
	
	@Insert("INSERT INTO TB_MEMBER(USER_NO, USER_ID, USER_PWD, USER_NAME, BIRTHDAY, PHONE, EMAIL, SNS_AGREE) VALUES (#{userNo}, #{userId}, #{userPwd}, #{userName}, #{birthday}, #{phone}, #{email}, #{snsAgree})")
	int signup(MemberDTO member);

	@Insert("INSERT INTO TB_MEMBER_GENRE(USER_NO, GENRE_ID) VALUES (#{userNo}, #{genreId})")
	int signup2(MemberGenreDTO genre);
	
	@Update("UPDATE TB_MEMBER SET USER_NAME = #{userName}, BIRTHDAY = #{birthday}, PHONE = #{phone}, EMAIL = #{email}, SNS_AGREE = #{snsAgree} WHERE USER_ID = #{userId}")
	int update(MemberDTO member);

	@Delete("DELETE FROM TB_MEMBER WHERE USER_ID = #{ userId }")
	int delete(String userId);

	@Delete("DELETE FROM TB_MEMBER_GENRE WHERE USER_NO = #{ userNo }")
	int delete2(int userNo);
	
}
