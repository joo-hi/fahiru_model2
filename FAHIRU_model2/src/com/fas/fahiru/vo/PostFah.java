package com.fas.fahiru.vo;

import java.sql.Timestamp;

public class PostFah {
	
	private int no, categoryNo, fahNo, postNo;
	private Timestamp regdate;
	private double score;
	
	public PostFah() {
		// TODO Auto-generated constructor stub
	}
	

	public double getScore() {
		return score;
	}



	public void setScore(double score) {
		this.score = score;
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

	public int getFahNo() {
		return fahNo;
	}

	public void setFahNo(int fahNo) {
		this.fahNo = fahNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
