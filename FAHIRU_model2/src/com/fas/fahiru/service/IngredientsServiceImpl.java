package com.fas.fahiru.service;

import java.util.List;

import com.fas.fahiru.dao.IngredientsDAO;
import com.fas.fahiru.dao.TfCooksDAO;
import com.fas.fahiru.vo.Ingredient;
import com.fas.fahiru.vo.TfCook;

public class IngredientsServiceImpl implements IngredientsService{

	private IngredientsDAO ingredientsDAO;
	private TfCooksDAO tfCooksDAO;
	
	public void setTfCooksDAO(TfCooksDAO tfCooksDAO) {
		this.tfCooksDAO = tfCooksDAO;
	}
	
	public void setIngredientsDAO(IngredientsDAO ingredientsDAO) {
		this.ingredientsDAO = ingredientsDAO;
	}
	
	@Override
	public void insert(Ingredient ingredient, String[] ingredientsName, String[] ingredientsUnit) {
		// TODO Auto-generated method stub

		
		for( int i  = 0; i<ingredientsName.length; i++) {
			
			ingredient.setName(ingredientsName[i]);
			ingredient.setUnit(ingredientsUnit[i]);
			
			ingredientsDAO.insert(ingredient);
		
		}
		
	}
	
	@Override
	public List<Ingredient> getIngredients(int no) {
		// TODO Auto-generated method stub
		return ingredientsDAO.selectIngredients(no);
	}
}
