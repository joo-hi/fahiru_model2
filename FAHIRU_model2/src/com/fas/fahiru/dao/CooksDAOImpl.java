package com.fas.fahiru.dao;

import java.util.List; 

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.vo.Cook;
import com.fas.fahiru.vo.PageVO;

public class CooksDAOImpl implements CooksDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}	

	// 0706 주하
	@Override
	public int insert(Cook cook) {
		// TODO Auto-generated method stub
		return session.insert("cooks.insert",cook);
	}
	
	//0709 승현 수정
	@Override
	public List<Cook> myPageCookList(PageVO pageVO) {
		return session.selectList("cooks.myPageCookList",pageVO);
	}
	@Override
	public List<Cook> MyPageCookBucketList(PageVO pageVO) {
		return session.selectList("cooks.MyPageCookBucketList",pageVO);
	}
	//0709 승현 수정 end
	
	// 07090709 주하
	@Override
	public Cook selectOneCooksDetail(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("cooks.selectOneCooksDetail",no);
	}

}
