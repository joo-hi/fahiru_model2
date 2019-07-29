package com.fas.fahiru.service;

import com.fas.fahiru.dao.PostFahsDAO;
import com.fas.fahiru.dao.TfCooksDAO;
import com.fas.fahiru.vo.PostFah;
import com.fas.fahiru.vo.TfCook;

public class PostFahsServiceImpl implements PostFahsService{

	private PostFahsDAO postFahsDAO;
	private TfCooksDAO tfCooksDAO;
	
	public void setPostFahsDAO(PostFahsDAO postFahsDAO) {
		this.postFahsDAO = postFahsDAO;
	}
	
	public void setTfCooksDAO(TfCooksDAO tfCooksDAO) {
		this.tfCooksDAO = tfCooksDAO;
	}
	
	@Override
	public void insert(PostFah postFah, String[] inputFahNo) {
		// TODO Auto-generated method stub


		int[] fahNo = new int[inputFahNo.length+1];
		
		for( int i  = 0; i<inputFahNo.length; i++) {
			
			fahNo[i] = Integer.parseInt(inputFahNo[i]);

			postFah.setFahNo(fahNo[i]);
	
			postFahsDAO.insertCook(postFah);
			
			// int result6 = PostFahsDAO.insert(postFah);
		}
		
		
	}
}
