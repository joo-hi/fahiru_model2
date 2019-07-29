package com.fas.fahiru.service;

import com.fas.fahiru.dao.ScoresDAO;
import com.fas.fahiru.vo.Like;
import com.fas.fahiru.vo.Score;

public class ScoresServiceImpl implements ScoresService{
	
	private ScoresDAO scoresDAO;
	
	public void setScoresDAO(ScoresDAO scoresDAO) {
		this.scoresDAO = scoresDAO;
	}
	
	@Override
	public int addEvaluate(Score score) {
		return scoresDAO.insert(score);
	}
	
	@Override
	public int removeEvaluate(Score score) {
		return scoresDAO.delete(score);
	}

	@Override
	public String checkTaste(Score score) {
		
		Score checkScore = scoresDAO.selectCheckTaste(score);
		
		boolean flag = checkScore==null;
		
   		// TG든 TB든 누른적이 있는지 check
   		// 누른적이 없을 때
		if(flag) {
			System.out.println("누른적이없음");
//			System.out.println("dlwngk");
			scoresDAO.insert(score);
//			System.out.println("hong");
		} // 누른적이 있다면
		else {
			System.out.println("누른적이있음");
			// db에 저장돼 있는 code와 파라미터로 넘어온 taste의 값이 같으면!
			if(checkScore.getCode().equals(score.getCode())) {
				// db에 저장돼 있는 것을 삭제
				scoresDAO.delete(score);
			// db에 저장돼 있는 code와 파라미터로 넘어온 taste의 값이 다르면!	
			}else {
				
				
				// db에 저장돼 있는 것을 삭제하고
				int resultl  = scoresDAO.delete(checkScore);
				System.out.println(resultl);
				// 인서트
				scoresDAO.insert(score);
			}	
		}
		
   		String finalTG ="";
   		String finalTB = "";
   		
		Score finalCheck = scoresDAO.selectCheckTaste(score);
		
   		
   		if(finalCheck==null){
   			finalTG = "false";
   			finalTB = "false"; 			   			
   		}else if(finalCheck.getCode().equals("TG")) {
   			finalTG = "true";
   			finalTB = "false";
   		}else if(finalCheck.getCode().equals("TB")) {
   			finalTG = "false";
   			finalTB = "true";  			
   		}
		
		return "{\"tgFlag\":"+finalTG+",\"tbFlag\":"+finalTB+"}";
	}
	
	@Override
	public String checkPlating(Score score) {
		
		Score checkScore = scoresDAO.selectCheckPlating(score);
		
		boolean flag = checkScore==null;
		
   		// TG든 TB든 누른적이 있는지 check
   		// 누른적이 없을 때
		if(flag) {
			System.out.println("누른적이없음");
//			System.out.println("dlwngk");
			scoresDAO.insert(score);
//			System.out.println("hong");
		} // 누른적이 있다면
		else {
			System.out.println("누른적이있음");
			// db에 저장돼 있는 code와 파라미터로 넘어온 taste의 값이 같으면!
			if(checkScore.getCode().equals(score.getCode())) {
				// db에 저장돼 있는 것을 삭제
				scoresDAO.delete(score);
			// db에 저장돼 있는 code와 파라미터로 넘어온 taste의 값이 다르면!	
			}else {
				// db에 저장돼 있는 것을 삭제하고
				System.out.println("여기는 오니??");
				int resultl  = scoresDAO.delete(checkScore);
				System.out.println(resultl);
				// 인서트
				scoresDAO.insert(score);
			}	
		}
		
   		String finalPG ="";
   		String finalPB = "";
   		
		Score finalCheck = scoresDAO.selectCheckPlating(score);
		
   		
   		if(finalCheck==null){
   			finalPG = "false";
   			finalPB = "false"; 			   			
   		}else if(finalCheck.getCode().equals("PG")) {
   			finalPG = "true";
   			finalPB = "false";
   		}else if(finalCheck.getCode().equals("PB")) {
   			finalPG = "false";
   			finalPB = "true";  			
   		}
		
		return "{\"pgFlag\":"+finalPG+",\"pbFlag\":"+finalPB+"}";
	}
	
	// 07090709 주하
	@Override
	public double getPlatingScore(Score score) {
		double pScore = Math.round(scoresDAO.selectPlatingScore(score)*100)/100.0;
		return pScore;
	}
	
	@Override
	public double getTasteScore(Score score) {
		
		double tScore = Math.round(scoresDAO.selectTasteScore(score)*100)/100.0;
		
		return tScore;
	}
	



}
