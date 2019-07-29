package com.fas.fahiru.vo;

import java.sql.Timestamp;
import java.util.List;

public class Fah {
	//	0709 서승현 name 추가
	private int no, categoryNo, userNo, postNo, cnt, ranking, cntFah, spotNo;
	private String explanation, fahImg, nickname, profileImg, fname,name;
	private Timestamp regdate;
	private double score;
	private List<TfCook> tfCook;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public List<TfCook> getTfCook() {
		return tfCook;
	}

	public void setTfCook(List<TfCook> tfCook) {
		this.tfCook = tfCook;
	}

	public int getCntFah() {
		return cntFah;
	}

	public void setCntFah(int cntFah) {
		this.cntFah = cntFah;
	}

	public int getSpotNo() {
		return spotNo;
	}

	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public double getScore() {
		return score;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public Fah() {
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

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public String getFahImg() {
		return fahImg;
	}

	public void setFahImg(String fahImg) {
		this.fahImg = fahImg;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
