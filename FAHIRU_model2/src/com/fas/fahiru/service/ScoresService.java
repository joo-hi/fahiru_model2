package com.fas.fahiru.service;

import com.fas.fahiru.vo.Score;

public interface ScoresService {
	
	public int addEvaluate(Score score);
	public int removeEvaluate(Score score);
	
	public String checkTaste(Score score);
	public String checkPlating(Score score);
	
	
	// 07090709 주하

	public double getPlatingScore(Score score);
	public double getTasteScore(Score score);

}
