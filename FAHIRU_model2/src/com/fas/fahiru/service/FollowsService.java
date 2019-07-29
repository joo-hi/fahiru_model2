package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;

import com.fas.fahiru.vo.Follow;

public interface FollowsService {
	//	0709 서승현
	public Map<String, Object> getFollow(int userNo,int page,int loginUserNo); 
	//	0709 서승현 end
	public int follow(int followingUserNo,int followerUserNo);
	
	// 0716 근경 
	//main Following
	public List<Follow> getMainFollowingList(int no);
	
}
