package com.fas.fahiru.vo;

import java.sql.Timestamp;
import java.util.List;

public class Spot {
	
	private int no, categoryNo, userNo, cnt, spotId, spotBucketCnt;
	private String name, img, imgFilter, address, subAddress, tfName, exist,
	timeInfo, parking, together,phoneNumer, nickname, profileImg;
	private double taste, plating, latitude, longitude, tftaste, tfplating;
	private Timestamp regdate;
	private List<TfCook> tfList;
	private List<Fah> fahList;
	
	
	
	public String getExist() {
		return exist;
	}

	public void setExist(String exist) {
		this.exist = exist;
	}

	public String getTfName() {
		return tfName;
	}

	public void setTfName(String tfName) {
		this.tfName = tfName;
	}

	public int getSpotBucketCnt() {
		return spotBucketCnt;
	}

	public void setSpotBucketCnt(int spotBucketCnt) {
		this.spotBucketCnt = spotBucketCnt;
	}

	
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public double getTftaste() {
		return tftaste;
	}

	public void setTftaste(double tftaste) {
		this.tftaste = tftaste;
	}

	public double getTfplating() {
		return tfplating;
	}

	public void setTfplating(double tfplating) {
		this.tfplating = tfplating;
	}

	public List<TfCook> getTfList() {
		return tfList;
	}

	public void setTfList(List<TfCook> tfList) {
		this.tfList = tfList;
	}

	public List<Fah> getFahList() {
		return fahList;
	}

	public void setFahList(List<Fah> fahList) {
		this.fahList = fahList;
	}

	public String getPhoneNumer() {
		return phoneNumer;
	}

	public void setPhoneNumer(String phoneNumer) {
		this.phoneNumer = phoneNumer;
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

	public Spot() {
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

	public String getImgFilter() {
		return imgFilter;
	}

	public void setImgFilter(String imgFilter) {
		this.imgFilter = imgFilter;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSubAddress() {
		return subAddress;
	}

	public void setSubAddress(String subAddress) {
		this.subAddress = subAddress;
	}

	public String getTimeInfo() {
		return timeInfo;
	}

	public void setTimeInfo(String timeInfo) {
		this.timeInfo = timeInfo;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getTogether() {
		return together;
	}

	public void setTogether(String together) {
		this.together = together;
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

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getSpotId() {
		return spotId;
	}

	public void setSpotId(int spotId) {
		this.spotId = spotId;
	}
	
	
	

}
