package com.fas.fahiru.service;

import java.util.List;

import com.fas.fahiru.vo.Ingredient;

public interface IngredientsService {

	public void insert(Ingredient ingredient, String[] ingredientsName, String[] ingredientsUnit);
	
	// 07090709 주하
	public List<Ingredient> getIngredients(int no);
}
