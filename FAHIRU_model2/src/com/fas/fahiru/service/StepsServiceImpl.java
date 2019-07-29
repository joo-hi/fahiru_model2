package com.fas.fahiru.service;

import com.fas.fahiru.dao.StepsDAO;
import com.fas.fahiru.vo.Step;

public class StepsServiceImpl implements StepsService {

	private StepsDAO stepsDAO;
	
	public void setStepsDAO(StepsDAO stepsDAO) {
		this.stepsDAO = stepsDAO;
	}
	
	@Override
	public void insert(Step step, String[] stepContents, String[] stepImg, String[] stepNum) {
		
		System.out.println(stepNum);
		
		System.out.println("사진");
		System.out.println(stepImg[0]);
		System.out.println(stepImg[1]);
		System.out.println(stepImg.length);
		
		int[] stepNumber = new int[stepNum.length+1];
		
		for( int i  = 0; i<stepNum.length; i++) {
	
			stepNumber[i] = Integer.parseInt(stepNum[i]);
			
			System.out.println(stepNum[i]);
		
			step.setCookStepTxt(stepContents[i]);
			step.setCookStepImg(stepImg[i]);
			step.setCookOrder(stepNumber[i]);
			
			stepsDAO.insert(step);
		}
		
	}
}
