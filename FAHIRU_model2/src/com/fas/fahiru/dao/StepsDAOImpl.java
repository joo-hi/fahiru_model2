package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.Step;

public class StepsDAOImpl implements StepsDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Step step) {
		// TODO Auto-generated method stub
		return session.insert("steps.insert",step);
	}

	// 07090709 주하
	@Override
	public List<Step> selectStepList(int no) {
		// TODO Auto-generated method stub
		return session.selectList("steps.selectStepList",no);
	}
}
