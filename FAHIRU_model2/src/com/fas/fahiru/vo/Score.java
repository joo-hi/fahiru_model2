package com.fas.fahiru.vo;

import java.sql.Timestamp;

public class Score {
	
	private int no, categoryNo, userNo, postNo;
	private String code;
	private Timestamp regdate;
	private double tasteResult, platingResult;
	
	
	
	public double getTasteResult() {
		return tasteResult;
	}

	public void setTasteResult(double tasteResult) {
		this.tasteResult = tasteResult;
	}

	public double getPlatingResult() {
		return platingResult;
	}

	public void setPlatingResult(double platingResult) {
		this.platingResult = platingResult;
	}

	public Score() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
