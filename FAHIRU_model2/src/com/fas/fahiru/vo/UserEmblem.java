package com.fas.fahiru.vo;

import java.sql.Timestamp;

public class UserEmblem {
	
	private int no, userNo, emblemNo;
	private Timestamp regdate;
	
	public UserEmblem() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getEmblemNo() {
		return emblemNo;
	}

	public void setEmblemNo(int emblemNo) {
		this.emblemNo = emblemNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
