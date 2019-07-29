package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.Ingredient;
import com.fas.fahiru.vo.Source;

public class SourcesDAOImpl implements SourcesDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// 0706 주하
	@Override
	public int insert(Source source) {
		// TODO Auto-generated method stub
		return session.insert("sources.insert",source);
	}
	
	
	// 07090709 주하
	@Override
	public List<Source> selectSources(int no) {
		// TODO Auto-generated method stub
		return session.selectList("sources.selectSources",no);
	}
}
