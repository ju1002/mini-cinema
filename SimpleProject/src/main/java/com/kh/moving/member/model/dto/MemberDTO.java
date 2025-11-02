package com.kh.moving.member.model.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberDTO {
	
	private int userNo;
    private String userId;
    private String userPwd;
    private String userName;
    private String birthday;
    private String email;
    private String phone;
    private String snsAgree;
    private Date erollDate;
    private String manager;
    private String status;
    
    private List<String> genreList;   // ✅ 선택된 장르들 (체크박스용)
    private String preferredGenres;   // ✅ DB 저장용 (콤마로 구분)
	
}