package com.kh.moving.member.model.dto;

import java.sql.Date;

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
	
}