package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import com.fas.fahiru.dao.FahsDAO;
import com.fas.fahiru.dao.LikesDAO;
import com.fas.fahiru.dao.RepliesDAO;
import com.fas.fahiru.dao.ScoresDAO;
import com.fas.fahiru.dao.TrendyFoodsDAO;
import com.fas.fahiru.vo.Like;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Reply;
import com.fas.fahiru.vo.Score;
import com.fas.fahiru.vo.TrendyFood;
import com.fas.fahiru.vo.User;

public class TrendyFoodsServiceImpl implements TrendyFoodsService {
	
	private TrendyFoodsDAO trendyFoodsDAO;
	private FahsDAO fahsDAO;
	private RepliesDAO repliesDAO;
	private LikesDAO likesDAO;
	private ScoresDAO scoresDAO;
	
	public void setTrendyFoodsDAO(TrendyFoodsDAO trendyFoodsDAO) {
		this.trendyFoodsDAO = trendyFoodsDAO;
	}
	public void setFahsDAO(FahsDAO fahsDAO) {
		this.fahsDAO = fahsDAO;
	}
	public void setRepliesDAO(RepliesDAO repliesDAO) {
		this.repliesDAO = repliesDAO;
	}
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	public void setScoresDAO(ScoresDAO scoresDAO) {
		this.scoresDAO = scoresDAO;
	}
	
	@Override
	public Map<String, Object> getOneDetail(int no, HttpSession session) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		User user = (User)session.getAttribute("loginUser");
		
		Reply reply = new Reply();
		
		Score score = new Score();
		
		reply.setPostNo(no);
		
		if(user!=null) {
			reply.setUserNo(user.getNo());
			score.setPostNo(no);
			score.setUserNo(user.getNo());
			score.setCategoryNo(2);
			map.put("myReplies", repliesDAO.selectListMyReply(reply));
			if(scoresDAO.selectCheckTaste(score)!=null) {
			map.put("myTaste", scoresDAO.selectCheckTaste(score));
			}
			if(scoresDAO.selectCheckPlating(score)!=null) {
			map.put("myPlating", scoresDAO.selectCheckPlating(score));
			}
		}
		Like like = new Like();
		
		like.setPostNo(no);
		like.setCategoryNo(2);
		
		
		
		map.put("tf", trendyFoodsDAO.selectOneByTcNo(no));
		map.put("fahs", fahsDAO.selectListTfFahs(no));
		map.put("bucketCnt", likesDAO.selectBucketCnt(like));
		
		return map;
	}
	//	0709 서승현
	@Override
	public List<TrendyFood> getMyPageList(int no, int page) {
		PageVO pageVO = new PageVO(page,8,no);
		return trendyFoodsDAO.myPageTrendyFoodList(pageVO);
	}
	@Override
	public List<TrendyFood> getBucketList(int no, int page) {
		PageVO pageVO = new PageVO(page,8,no);
		return trendyFoodsDAO.MyPageTrendyFoodBucketList(pageVO);
	}
	//	0709 서승현 end
}
