package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.Step;

public interface StepsDAO {

	public int insert(Step step);
	
	// 07090709 주하
	public List<Step> selectStepList(int no);
	
}
