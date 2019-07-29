package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.Ingredient;

public class IngredientsDAOImpl implements IngredientsDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Ingredient ingredient) {
		// TODO Auto-generated method stub
		return session.insert("ingredients.insert",ingredient);
	}
	
	// 07090709 주하
	@Override
	public List<Ingredient> selectIngredients(int no) {
		// TODO Auto-generated method stub
		return session.selectList("ingredients.selectIngredients",no);
	}

}
