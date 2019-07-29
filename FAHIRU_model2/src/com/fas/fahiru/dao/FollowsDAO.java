package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.Follow;
import com.fas.fahiru.vo.PageVO;

public interface FollowsDAO {
	//0709 승현 수정
	public List<Follow> selectFollowingList(PageVO pageVO);
	public List<Follow> selectFollowerList(PageVO pageVO);
	//0709 승현 수정 end
	//추가 수정
	public int selectFollower(Follow follow);
	public int followingInsert(Follow follow);
	public int followingDelete(Follow follow);
	public int followerSelectOne(Follow follow);
	
	//0716근경
	//main following
	public List<Follow> selectFollowingListH(int followingUserNo);
	
}
