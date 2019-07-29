package com.fas.fahiru.vo;

import java.sql.Timestamp;

public class CookTip {
	

	
	private int no, cookNo, stepNo, userNo;
	private Timestamp regdate;
	private String content, profileImg, nickname;
	
	public CookTip() {
		// TODO Auto-generated constructor stub
	}

	
	
	public String getProfileImg() {
		return profileImg;
	}



	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCookNo() {
		return cookNo;
	}

	public void setCookNo(int cookNo) {
		this.cookNo = cookNo;
	}

	public int getStepNo() {
		return stepNo;
	}

	public void setStepNo(int stepNo) {
		this.stepNo = stepNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	

}
