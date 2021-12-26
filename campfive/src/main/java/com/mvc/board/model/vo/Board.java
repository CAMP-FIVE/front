package com.mvc.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int rnum;
	
	private int no;
	
	private int write_no;
	
	private String id;
	
	private String pwd;
	
	private String title;
	
	private String content;
	
	private Date create_date;
	
	private Date modify_date;
	
	private int hit;
	
	private String status;
	
	private String originalFileName;
	
	private String renamedFileName;
}