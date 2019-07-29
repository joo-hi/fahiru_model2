package com.fas.fahiru.service;

import com.fas.fahiru.dao.CookTipsDAO;
import com.fas.fahiru.vo.CookTip;

public class CookTipsServiceImpl implements CookTipsService {

	private CookTipsDAO cookTipsDAO;
	
	public void setCookTipsDAO(CookTipsDAO cookTipsDAO) {
		this.cookTipsDAO = cookTipsDAO;
	}
	
	@Override
	public int registerCookTip(CookTip cookTip) {
		// TODO Auto-generated method stub
		return cookTipsDAO.insertCookTip(cookTip);
	}
	
	@Override
	public int remove(int no) {
		// TODO Auto-generated method stub
		return cookTipsDAO.delete(no);
	}
}
