package com.fas.fahiru.dao;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.vo.Score;

public class ScoresDAOImpl implements ScoresDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Score score) {
		return session.insert("scores.insert", score);
	}
	
	@Override
	public int delete(Score score) {
		return session.delete("scores.delete", score);
	}
	
	@Override
	public Score selectCheckTaste(Score score) {
		return session.selectOne("scores.selectCheckTaste",score);
	}
	
	@Override
	public Score selectCheckPlating(Score score) {
		return session.selectOne("scores.selectCheckPlating", score);
	}

	// 07090709 주하

	
	@Override
	public double selectTasteScore(Score score) {
		// TODO Auto-generated method stub
		return session.selectOne("scores.selectTasteScore",score);
	}
	
	@Override
	public double selectPlatingScore(Score score) {
		// TODO Auto-generated method stub
		return session.selectOne("scores.selectPlatingScore",score);
	}
}
