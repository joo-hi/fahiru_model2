package com.fas.fahiru.service;

import com.fas.fahiru.vo.Like;

public interface LikesService {
	
	public int addBucket(Like like);
	public int removeBucket(Like like);
	public Like checkBucket(Like like);
	public int countBucket(Like like);
	
	public int addReplyLike(Like like);
	public int removeReplyLike(Like like);
	public Like checkReplyLike(Like like);
	public int countReplyLike(Like like);

	public int getSpotBucketCnt(int postNo);
	// 07150715 주하
	public Like checkCookTipLike(Like like);
	public int addCookTipLike(Like like);
	public int removeCookTipLike(Like like);
	public int countCookTipLikeCnt(Like like);

}
