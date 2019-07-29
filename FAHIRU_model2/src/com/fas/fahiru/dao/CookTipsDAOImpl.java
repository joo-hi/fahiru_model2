package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.vo.CookTip;

public class CookTipsDAOImpl implements CookTipsDAO {

//	07100710 주하
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<CookTip> selectCookTipsList(int no) {
		// TODO Auto-generated method stub
		return session.selectList("cookTips.selectCookTipsList", no);
	}
	
	@Override
	public int insertCookTip(CookTip cookTip) {
		// TODO Auto-generated method stub
		return session.insert("cookTips.insertCookTip",cookTip);
	}
	
	@Override
		public int delete(int no) {
			// TODO Auto-generated method stub
			return session.delete("cookTips.delete",no);
		}
}
