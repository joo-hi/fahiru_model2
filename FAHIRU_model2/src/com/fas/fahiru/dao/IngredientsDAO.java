package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.Ingredient;

public interface IngredientsDAO {

	public int insert(Ingredient ingredient);
	
	// 07090709 주하
	public List<Ingredient> selectIngredients(int no);
}
