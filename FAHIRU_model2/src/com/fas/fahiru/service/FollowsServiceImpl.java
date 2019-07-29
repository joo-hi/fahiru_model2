package com.fas.fahiru.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fas.fahiru.dao.FollowsDAO;
import com.fas.fahiru.dao.TfCooksDAO;
import com.fas.fahiru.vo.Follow;
import com.fas.fahiru.vo.PageVO;

public class FollowsServiceImpl implements FollowsService {
	private FollowsDAO followsDAO;
	private TfCooksDAO tfCooksDAO;
	
	public void setFollowsDAO(FollowsDAO followsDAO) {
		this.followsDAO = followsDAO;
	}
	public void setTfCooksDAO(TfCooksDAO tfCooksDAO) {
		this.tfCooksDAO = tfCooksDAO;
	}
	
	//	0709 서승현
	@Override
	public Map<String, Object> getFollow(int userNo,int page,int loginUserNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageVO pageVO = new PageVO(page,8,userNo);
		
		List<Follow> follower = followsDAO.selectFollowerList(pageVO);
		List<Follow> following = followsDAO.selectFollowingList(pageVO);
		
		for (Follow follow : follower) {
			Follow follow2 = new Follow();
			follow2.setFollowingUserNo(loginUserNo);
			follow2.setFollowerUserNo(follow.getFollowingUserNo());
			follow.setFollow(1==followsDAO.selectFollower(follow2));
		}
		
		for (Follow follow : following) {
			Follow follow2 = new Follow();
			follow2.setFollowingUserNo(loginUserNo);
			follow2.setFollowerUserNo(follow.getFollowerUserNo());
			follow.setFollow(1==followsDAO.selectFollower(follow2));
		}
		
		map.put("followings",following);
		map.put("followers",follower);
		return map;
	}
	//	0709 서승현 end
	
	@Override
	public int follow(int followingUserNo, int followerUserNo) {
		Follow follow = new Follow(followingUserNo,followerUserNo);
		
		int count = followsDAO.followerSelectOne(follow);
		
		if(count==1) {
			count = followsDAO.followingDelete(follow);
			System.out.println(" delete : "+ count);
			return count;
		}else {
			count =followsDAO.followingInsert(follow);
			System.out.println(" insert : "+ count);
			return count;
		}		
		
	}
	
	//0716 근경
	//main Following
	@Override
	public List<Follow> getMainFollowingList(int no) {
		
		List<Follow> list = followsDAO.selectFollowingListH(no);
		
		for(Follow follow:list){
			follow.setTfCooks(tfCooksDAO.selectTcListByUserNo(follow.getNo()));
		}
		
		return  list;
		//한번 더 배워가빈다... 이것이 리스트다...
	}
}
