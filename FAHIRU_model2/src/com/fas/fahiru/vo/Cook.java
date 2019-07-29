package com.fas.fahiru.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Cook {
	
	// 0622 vo 추가
	private int no, cookAmount, categoryNo, cnt, userNo;
	private String cookTime, openAccept, tipAccept, profileImg, img, nickname, name, imgFilter;
	private Timestamp regdate;
	private double taste, plating, score;
	
	public Cook() {
		// TODO Auto-generated constructor stub
	}

	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public String getImgFilter() {
		return imgFilter;
	}



	public void setImgFilter(String imgFilter) {
		this.imgFilter = imgFilter;
	}



	public int getCategoryNo() {
		return categoryNo;
	}



	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}



	public int getCnt() {
		return cnt;
	}



	public void setCnt(int cnt) {
		this.cnt = cnt;
	}



	public String getProfileImg() {
		return profileImg;
	}



	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}



	public String getImg() {
		return img;
	}



	public void setImg(String img) {
		this.img = img;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
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

	public int getCookAmount() {
		return cookAmount;
	}

	public void setCookAmount(int cookAmount) {
		this.cookAmount = cookAmount;
	}

	public String getCookTime() {
		return cookTime;
	}

	public void setCookTime(String cookTime) {
		this.cookTime = cookTime;
	}

	public String getOpenAccept() {
		return openAccept;
	}

	public void setOpenAccept(String openAccept) {
		this.openAccept = openAccept;
	}

	public String getTipAccept() {
		return tipAccept;
	}

	public void setTipAccept(String tipAccept) {
		this.tipAccept = tipAccept;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public double getTaste() {
		return taste;
	}

	public void setTaste(double taste) {
		this.taste = taste;
	}

	public double getPlating() {
		return plating;
	}

	public void setPlating(double plating) {
		this.plating = plating;
	}
	
	
	
	

}
