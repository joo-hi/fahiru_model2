package com.fas.fahiru.vo;

import java.sql.Timestamp;

public class FahiruScore {
	
	private int no, fahNo;
	private double score;
	private Timestamp regdate;
	
	public FahiruScore() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFahNo() {
		return fahNo;
	}

	public void setFahNo(int fahNo) {
		this.fahNo = fahNo;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
