   package com.fas.fahiru.vo;

import java.sql.Timestamp;
import java.util.List;

public class Reply {
	
	private int no, categoryNo, userNo, postNo, cnt, likeCnt;
	private String content, replyImg, nickname, profileImg;
	private Timestamp regdate;
	private List<Reply> reply;
	private boolean likeFlag;
	
	
	
	public Reply() {
		// TODO Auto-generated constructor stub
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



	public String getProfileImg() {
		return profileImg;
	}



	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}



	public List<Reply> getReply() {
		return reply;
	}



	public void setReply(List<Reply> reply) {
		this.reply = reply;
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


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getReplyImg() {
		return replyImg;
	}


	public void setReplyImg(String replyImg) {
		this.replyImg = replyImg;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}



	public int getLikeCnt() {
		return likeCnt;
	}



	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}



	public boolean isLikeFlag() {
		return likeFlag;
	}



	public void setLikeFlag(boolean likeFlag) {
		this.likeFlag = likeFlag;
	}
	
	
	
	

}
