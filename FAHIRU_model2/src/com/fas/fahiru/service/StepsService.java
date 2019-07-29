package com.fas.fahiru.service;

import com.fas.fahiru.vo.Step;

public interface StepsService {

	public void insert(Step step, String[] stepContents, String[] stepImg, String[] stepNumStr);
}
