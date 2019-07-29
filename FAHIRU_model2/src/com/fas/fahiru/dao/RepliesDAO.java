package com.fas.fahiru.dao;

import java.util.List;

import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Reply;

public interface RepliesDAO {
	
	public List<Reply> selectListMyReply(Reply reply);
	
	//0709 승현 수정
	public List<Reply> myPageList(PageVO pageVO);
	//0709 승현 수정 end
	
	
	//홍성표 0711
	public List<Reply> selectListReplyOrderByLike(PageVO pageVO);
	public int selectReplyImgCnt(int postNo);
	public int insert(Reply reply);
	public int selectRepliesTotal(int postNo);
	public int delete(int replyNo);
	
	// 07090709 주하
	public int selectCookBucketCnt(int postNo);
	
	// 07130713 주하
	public List<Reply> selectListReplies(PageVO pageVO);

}
