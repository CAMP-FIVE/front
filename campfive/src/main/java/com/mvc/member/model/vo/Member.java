package com.mvc.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	
	private String id;
	
	private String name;
	
	private String password;
	
	private String role;
	
	private String nickname;
	
	private String phone;
	
	private String email;
	
	private String businessNo;
	
	private String status;

	private Date enrollDate;
	
	private Date modifyDate;

		
	}

