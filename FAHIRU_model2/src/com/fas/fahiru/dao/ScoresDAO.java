package com.fas.fahiru.dao;

import com.fas.fahiru.vo.Score;

public interface ScoresDAO {
	
	public int insert(Score score);
	
	public int delete(Score score);
	
	public Score selectCheckTaste(Score score);
	
	public Score selectCheckPlating(Score score);
	
	// 07090709 주하
	public double selectPlatingScore(Score score);
	public double selectTasteScore(Score score);

}
