package com.fas.fahiru.vo;

import java.sql.Timestamp;

public class Like {
	
	// 07130713 주하
	// 07150715 주하
	private int no, categoryNo, postNo, userNo, replyNo, stepNo, honeytipNo, replyLikeCnt,
				tfCnt, cookBucketCnt, spotBucketCnt, score, cnt , tfLikeCnt, bucketTFCnt, likeCnt, cookTipLikeCnt;
	private Timestamp regdate;
	private String nickname, name, img, profileImg;
	private double taste, plating;
	
	
	
	
	public int getCookTipLikeCnt() {
		return cookTipLikeCnt;
	}


	public void setCookTipLikeCnt(int cookTipLikeCnt) {
		this.cookTipLikeCnt = cookTipLikeCnt;
	}


	public int getLikeCnt() {
		return likeCnt;
	}


	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}


	public int getReplyLikeCnt() {
		return replyLikeCnt;
	}


	public void setReplyLikeCnt(int replyLikeCnt) {
		this.replyLikeCnt = replyLikeCnt;
	}


	public int getBucketTFCnt() {
		return bucketTFCnt;
	}

	
	public void setBucketTFCnt(int bucketTFCnt) {
		this.bucketTFCnt = bucketTFCnt;
	}


	public int getTfLikeCnt() {
		return tfLikeCnt;
	}


	public void setTfLikeCnt(int tfLikeCnt) {
		this.tfLikeCnt = tfLikeCnt;
	}

	
	public Like() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	public int getScore() {
		return score;
	}




	public void setScore(int score) {
		this.score = score;
	}




	public int getCnt() {
		return cnt;
	}




	public void setCnt(int cnt) {
		this.cnt = cnt;
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




	public String getImg() {
		return img;
	}




	public void setImg(String img) {
		this.img = img;
	}




	public String getProfileImg() {
		return profileImg;
	}




	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
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




	public int getTfCnt() {
		return tfCnt;
	}



	public void setTfCnt(int tfCnt) {
		this.tfCnt = tfCnt;
	}



	public int getCookBucketCnt() {
		return cookBucketCnt;
	}



	public void setCookBucketCnt(int cookBucketCnt) {
		this.cookBucketCnt = cookBucketCnt;
	}



	public int getSpotBucketCnt() {
		return spotBucketCnt;
	}



	public void setSpotBucketCnt(int spotBucketCnt) {
		this.spotBucketCnt = spotBucketCnt;
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

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getStepNo() {
		return stepNo;
	}

	public void setStepNo(int stepNo) {
		this.stepNo = stepNo;
	}

	public int getHoneytipNo() {
		return honeytipNo;
	}

	public void setHoneytipNo(int honeytipNo) {
		this.honeytipNo = honeytipNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
