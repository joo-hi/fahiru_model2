package com.fas.fahiru.vo;

import java.sql.Timestamp;

public class TrendyFood {
	
	private int no, spotNo, price,categoryNo,score,cnt, userNo, bucketTFCnt;
	private String shopName, name, nickname, profileImg, img, imgFilter;
	private double taste, plating;
	private Timestamp regdate;
	
	
	public int getBucketTFCnt() {
		return bucketTFCnt;
	}

	public void setBucketTFCnt(int bucketTFCnt) {
		this.bucketTFCnt = bucketTFCnt;
	}

	
	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public TrendyFood() {
		// TODO Auto-generated constructor stub
	}

	
	
	public String getShopName() {
		return shopName;
	}



	public void setShopName(String shopName) {
		this.shopName = shopName;
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


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSpotNo() {
		return spotNo;
	}

	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
