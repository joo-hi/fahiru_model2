package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.fas.fahiru.vo.Reply;

public interface RepliesService {
	//	0709 서승현
	public List<Reply> myPageCommentList(int no,int page);
	//	0709 서승현 end
	
	//홍성표 0711
	public Map<String, Object> getReplyImgOrderByLike(int pageNo, int no);
	public int writeReply(Reply reply);
	public Map<String, Object> getReplies(int no, int page, HttpSession session);
	public int removeReply(int replyNo);
}
