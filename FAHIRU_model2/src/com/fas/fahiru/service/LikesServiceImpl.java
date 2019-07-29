package com.fas.fahiru.service;

import com.fas.fahiru.dao.LikesDAO;
import com.fas.fahiru.vo.Like;

public class LikesServiceImpl implements LikesService {
	
	public LikesDAO likesDAO;
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	
	@Override
	public int addBucket(Like like) {
		return likesDAO.insertBucket(like);
	}
	
	@Override
	public int removeBucket(Like like) {
		return likesDAO.deleteBucket(like);
	}
	
	@Override
	public Like checkBucket(Like like) {
		return likesDAO.selectBucketCheck(like);
	}
	
	@Override
	public int countBucket(Like like) {
		return likesDAO.selectBucketCnt(like);
	}
	
	@Override
	public int addReplyLike(Like like) {
		return likesDAO.insertReplyLike(like);
	}
	
	@Override
	public int removeReplyLike(Like like) {
		return likesDAO.deleteReplyLike(like);
	}
	
	@Override
	public Like checkReplyLike(Like like) {
		return likesDAO.selectReplyLikeCheck(like);
	}
	
	@Override
	public int countReplyLike(Like like) {
		return likesDAO.selectReplyLikeCnt(like);
	}
	
	@Override
	public int getSpotBucketCnt(int postNo) {
		// TODO Auto-generated method stub
		return likesDAO.selectSpotBucketCnt(postNo);
	}

	// 07150715 주하
	@Override
	public Like checkCookTipLike(Like like) {
		// TODO Auto-generated method stub
		return likesDAO.selectCookTipLike(like);
	}
	
	@Override
	public int addCookTipLike(Like like) {
		// TODO Auto-generated method stub
		return likesDAO.insertCookTipLike(like);
	}
	
	@Override
	public int removeCookTipLike(Like like) {
		// TODO Auto-generated method stub
		return likesDAO.deleteCookTipLike(like);
	}
	
	@Override
	public int countCookTipLikeCnt(Like like) {
		// TODO Auto-generated method stub
		return likesDAO.selectCookTipLikeCnt(like);
	}
}
