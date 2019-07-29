package com.fas.fahiru.service;

import com.fas.fahiru.dao.SourcesDAO;
import com.fas.fahiru.vo.Source;

public class SourcesServiceImpl implements SourcesService {

	private SourcesDAO sourcesDAO;
	
	public void setSourcesDAO(SourcesDAO sourcesDAO) {
		this.sourcesDAO = sourcesDAO;
	}
	
	@Override
	public void insert(Source source, String[] sourceName, String[] sourceAmmount, String[] sourceUnit) {
		// TODO Auto-generated method stub
		
		int[] amountL = new int[sourceAmmount.length+1];
		
		for( int i  = 0; i<sourceName.length; i++) {

			amountL[i] = Integer.parseInt(sourceAmmount[i]);
	
			source.setName(sourceName[i]);
			source.setAmmount(amountL[i]);
			source.setUnit(sourceUnit[i]);
			
			System.out.println(source.getName());
			System.out.println(source.getAmmount());
			System.out.println(source.getUnit());
		
			sourcesDAO.insert(source);
		}

	}
}
