package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import com.fas.fahiru.dao.CookTipsDAO;
import com.fas.fahiru.dao.CooksDAO;
import com.fas.fahiru.dao.FahsDAO;
import com.fas.fahiru.dao.IngredientsDAO;
import com.fas.fahiru.dao.LikesDAO;
import com.fas.fahiru.dao.RepliesDAO;
import com.fas.fahiru.dao.ScoresDAO;
import com.fas.fahiru.dao.SourcesDAO;
import com.fas.fahiru.dao.StepsDAO;
import com.fas.fahiru.dao.TfCooksDAO;
import com.fas.fahiru.vo.Cook;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Reply;
import com.fas.fahiru.vo.Score;
import com.fas.fahiru.vo.User;

public class CooksServiceImpl implements CooksService {

	// 07090709 주하
	private CooksDAO cooksDAO;
	private TfCooksDAO tfCooksDAO;
	private IngredientsDAO ingredientsDAO;
	private SourcesDAO sourcesDAO;
	private FahsDAO fahsDAO;
	private LikesDAO likesDAO;
	private StepsDAO stepsDAO;
	private CookTipsDAO cookTipsDAO;
	// 07150715 주하
	private ScoresDAO scoresDAO;
	private RepliesDAO repliesDAO;
	
	public void setRepliesDAO(RepliesDAO repliesDAO) {
		this.repliesDAO = repliesDAO;
	}
	
	public void setScoresDAO(ScoresDAO scoresDAO) {
		this.scoresDAO = scoresDAO;
	}
	
	public void setCookTipsDAO(CookTipsDAO cookTipsDAO) {
		this.cookTipsDAO = cookTipsDAO;
	}
	
	
	public void setStepsDAO(StepsDAO stepsDAO) {
		this.stepsDAO = stepsDAO;
	}
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	
	
	public void setFahsDAO(FahsDAO fahsDAO) {
		this.fahsDAO = fahsDAO;
	}
	
	public void setSourcesDAO(SourcesDAO sourcesDAO) {
		this.sourcesDAO = sourcesDAO;
	}
	
	public void setIngredientsDAO(IngredientsDAO ingredientsDAO) {
		this.ingredientsDAO = ingredientsDAO;
	}
	
	public void setCooksDAO(CooksDAO cooksDAO) {
		this.cooksDAO = cooksDAO;
	}
	
	public void setTfCooksDAO(TfCooksDAO tfCooksDAO) {
		this.tfCooksDAO = tfCooksDAO;
	}
	
	@Override
	public int insert(Cook cook, String name, String openAccept, String tipAccept) {
		// TODO Auto-generated method stub
		
		String oa="";
		String ta="";
		
		if(openAccept.equals("on")) {
			oa = "Y";
		}else {
			oa = "N";
		}
		if(tipAccept.equals("on")) {
			ta = "Y";
		}else {
			ta = "N";
		}
		
		cook.setOpenAccept(oa);
		cook.setTipAccept(ta);
		
		return cooksDAO.insert(cook);
	}
	
	//	0709 서승현
	@Override
	public List<Cook> getMyPageList(int no, int page) {
		PageVO pageVO = new PageVO(page,8,no);
		return cooksDAO.myPageCookList(pageVO);
	}
	@Override
	public List<Cook> getBucketList(int no, int page) {
		PageVO pageVO = new PageVO(page,8,no);
		return cooksDAO.MyPageCookBucketList(pageVO);
	}
	//	0709 서승현 end
	
	// 07090709 주하
	@Override
	public Map<String, Object> getOneCooksDetail(int no, HttpSession session) {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
//		CookTip cookTip = new CookTip();
		
		map.put("cook",cooksDAO.selectOneCooksDetail(no));
		map.put("ingredients",ingredientsDAO.selectIngredients(no));
		map.put("sources",sourcesDAO.selectSources(no));
		map.put("fahs", fahsDAO.selectCookFahList(no));
		map.put("like",likesDAO.selectCookBucketCnt(no));
		map.put("steps",stepsDAO.selectStepList(no));
		
//		List<Step> step = stepsDAO.selectStepList(no);
//
//		// System.out.println(step.get(0).getCookOrder());
//		cookTip.setCookNo(step.get(0).getCookNo());
//
//		for( int i  = 0; i<step.size(); i++) {
//		
//			cookTip.setStepNo(step.get(i).getCookOrder());
//			System.out.println(cookTip.getStepNo());
//
//		}
		User user = (User)session.getAttribute("loginUser");
		
		Reply reply = new Reply();
		
		Score score = new Score();
		
		reply.setPostNo(no);
		
		if(user!=null) {
			reply.setUserNo(user.getNo());
			score.setPostNo(no);
			score.setUserNo(user.getNo());
			score.setCategoryNo(3);
			map.put("myReplies", repliesDAO.selectListMyReply(reply));
			if(scoresDAO.selectCheckTaste(score)!=null) {
			map.put("myTaste", scoresDAO.selectCheckTaste(score));
			}
			if(scoresDAO.selectCheckPlating(score)!=null) {
			map.put("myPlating", scoresDAO.selectCheckPlating(score));
			}
		}

		map.put("cookTips",cookTipsDAO.selectCookTipsList(no));
		
		
		return map;
	}
	
}
