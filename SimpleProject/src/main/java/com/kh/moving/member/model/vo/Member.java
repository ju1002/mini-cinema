package com.kh.moving.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {
    private int userNo;
    private String userId;
    private String userPwd;
    private String userName;
    private String birthday;
    private String email;
    private String phone;
    private String snsAgree;
    private Date enrollDate;
    private String manager;
    private String status;
}