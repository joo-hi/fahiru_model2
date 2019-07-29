package com.fas.fahiru.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

//검색때문에 만든 VO임
public class UserForSearch {
	
	public static final String LOGIN_USER = "loginUser";
	
	private int no, totalCnt, followCnt;
	private String email, nickname, password, gender, message, profileImg;
	private Timestamp regdate;
	private Date birthDate;
	
	public UserForSearch(int userNo, String fileName) {
		this.no = userNo;
		this.profileImg = fileName;
	} 
	
	public UserForSearch() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getFollowCnt() {
		return followCnt;
	}

	public void setFollowCnt(int followCnt) {
		this.followCnt = followCnt;
	}

	public static String getLoginUser() {
		return LOGIN_USER;
	}
	
	
	
	

}
