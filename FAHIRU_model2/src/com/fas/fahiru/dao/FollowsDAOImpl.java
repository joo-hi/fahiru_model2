package com.fas.fahiru.dao;

import java.util.List;  
import org.apache.ibatis.session.SqlSession;
import com.fas.fahiru.vo.Follow;
import com.fas.fahiru.vo.PageVO;

//0709 승현 수정
public class FollowsDAOImpl implements FollowsDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}	
	
	@Override
	public List<Follow> selectFollowingList(PageVO pageVO) {
		return session.selectList("follows.selectFollowingList",pageVO);
	}
	
	@Override
	public List<Follow> selectFollowerList(PageVO pageVO) {
		return session.selectList("follows.selectFollowerList",pageVO);
	}
	//0709 승현 수정 end
	
	@Override
	public int selectFollower(Follow follow) {
		return session.selectOne("follows.selectFollowCnt",follow);
	}
	
	@Override
	public int followingInsert(Follow follow) {
		return session.insert("follows.followingInsert",follow);
	}
	
	@Override
	public int followingDelete(Follow follow) {
		return session.delete("follows.followingDelete",follow);
	}
	
	@Override
	public int followerSelectOne(Follow follow) {
		return session.selectOne("follows.followerSelectOne",follow);
	}
	
	//0716 근경
	//main following
	@Override
	public List<Follow> selectFollowingListH(int followingUserNo) {
		
		
		return session.selectList("follows.selectFollowingListH",followingUserNo);
		
	}
	
}
