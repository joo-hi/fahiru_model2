package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.CookTip;

public interface CookTipsDAO {

	
	// 07100710 주하
	
	public List<CookTip> selectCookTipsList(int no);
	
	public int insertCookTip(CookTip cookTip);
	
	public int delete(int no);
}
