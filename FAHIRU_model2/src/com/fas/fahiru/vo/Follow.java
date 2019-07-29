package com.fas.fahiru.vo;

import java.sql.Timestamp;
import java.util.List;

public class Follow {

	private int no, followingUserNo, followerUserNo, cnt, tcCnt;
	private Timestamp regdate;
	private String nickname, userProfileImg;
	private boolean isFollow;
	private List<TfCook> tfCooks;

	public int getTcCnt() {
		return tcCnt;
	}

	public boolean isFollow() {
		return isFollow;
	}

	public void setFollow(boolean isFollow) {
		this.isFollow = isFollow;
	}

	public void setTcCnt(int tcCnt) {
		this.tcCnt = tcCnt;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public List<TfCook> getTfCooks() {
		return tfCooks;
	}

	public void setTfCooks(List<TfCook> tfCooks) {
		this.tfCooks = tfCooks;
	}

	public Follow() {
		// TODO Auto-generated constructor stub
	}

	public Follow(int followingUserNo, int followerUserNo) {
		this.followingUserNo = followingUserNo;
		this.followerUserNo = followerUserNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUserProfileImg() {
		return userProfileImg;
	}

	public void setUserProfileImg(String userProfileImg) {
		this.userProfileImg = userProfileImg;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFollowingUserNo() {
		return followingUserNo;
	}

	public void setFollowingUserNo(int folloingUserNo) {
		this.followingUserNo = folloingUserNo;
	}

	public int getFollowerUserNo() {
		return followerUserNo;
	}

	public void setFollowerUserNo(int followerUserNo) {
		this.followerUserNo = followerUserNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
