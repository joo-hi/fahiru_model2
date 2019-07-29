package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.Like;

public interface LikesDAO {
	
	public int selectSpotBucketCnt(int no);
	public Like selectTfLikeCnt(Like like);
	public int insertBucket(Like like);
	public int deleteBucket(Like like);
	public Like selectBucketCheck(Like like);
	public int selectBucketCnt(Like like);
	public Like selectReplyLikeCheck(Like like);
	public int insertReplyLike(Like like);
	public int deleteReplyLike(Like like);
	public int selectReplyLikeCnt(Like like); 
	public List<Like> myPageRepliesLikesCnt(Like like);
	// 07090709 주하
	public int selectCookBucketCnt(int no);
	// 07150715 주하
	public Like selectCookTipLike(Like like);
	public int insertCookTipLike(Like like);
	public int deleteCookTipLike(Like like);
	public int selectCookTipLikeCnt(Like like);
}
