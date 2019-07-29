package com.fas.fahiru.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import com.fas.fahiru.dao.LikesDAO;
import com.fas.fahiru.dao.RepliesDAO;
import com.fas.fahiru.util.PaginateUtil;
import com.fas.fahiru.vo.Like;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Reply;
import com.fas.fahiru.vo.User;

public class RepliesServiceImpl implements RepliesService {
	private RepliesDAO repliesDAO;
	private LikesDAO likesDAO;
	private PaginateUtil paginateUtil;
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	public void setRepliesDAO(RepliesDAO repliesDAO) {
		this.repliesDAO = repliesDAO;
	}
	
	//	0709 서승현
	@Override
	public List<Reply> myPageCommentList(int no, int page) {
		PageVO pageVO = new PageVO(page,8,no);
		return repliesDAO.myPageList(pageVO);
	}
	//	0709 서승현 end
	
	
	
	// 홍성표 0711
	@Override
	public Map<String, Object> getReplyImgOrderByLike(int pageNo, int no) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO = new PageVO(pageNo, 4, no);
		
		
		map.put("repliesImgCnt", repliesDAO.selectReplyImgCnt(no));
		map.put("repliesImg",repliesDAO.selectListReplyOrderByLike(pageVO));
		
		return map;
	}
	
	@Override
	public int writeReply(Reply reply) {
		return repliesDAO.insert(reply);
	}
	
	@Override
	public Map<String, Object> getReplies(int no, int page, HttpSession session) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		User user = (User)session.getAttribute("loginUser");
		
		PageVO pageVO = new PageVO(page, 5, no);
		
		System.out.println("page: "+pageVO.getPageNo());
		System.out.println("numpage: "+pageVO.getNumPage());
		System.out.println("no: "+pageVO.getNo());
		
		Reply reply = new Reply();
		
		List<Reply> replies = repliesDAO.selectListReplies(pageVO);
		
		if(user!=null) {
			reply.setUserNo(user.getNo());
			reply.setPostNo(no);
			map.put("myReplies", repliesDAO.selectListMyReply(reply));
		}
		
		Like like = new Like();
		
		like.setPostNo(no);
		like.setCategoryNo(2);
		
		for(Reply replyC : replies) {
			like.setReplyNo(replyC.getNo());
			like.setPostNo(no);
			int likeCnt = 0;
			if(likesDAO.selectTfLikeCnt(like)!=null) {
				likeCnt = likesDAO.selectReplyLikeCnt(like);
			}
			replyC.setLikeCnt(likeCnt);
			boolean likeFlag = false;
			if(user!=null) { 
				like.setUserNo(user.getNo());
				likeFlag = likesDAO.selectReplyLikeCheck(like)!=null;
			}
			replyC.setLikeFlag(likeFlag);
			
			System.out.println(replyC.getRegdate());
		}
		int total = repliesDAO.selectRepliesTotal(no);
		 
		map.put("replies", replies);
		map.put("paginate",paginateUtil.getPaginate(page, total, 5, 5, "/ajax/reply/"+no));
		
		return map;
	}
	
	@Override
	public int removeReply(int replyNo) {
		return repliesDAO.delete(replyNo);
	}
}
