package com.fas.fahiru.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fas.fahiru.util.SqlSessionUtil;
import com.fas.fahiru.vo.PageVO;
import com.fas.fahiru.vo.Reply;

public class RepliesDAOImpl implements RepliesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public static int selectTotalTFReplies(int no) {

		int total = 0;

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();

			return total = session.selectOne("replies.selectTotalTFReplies", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return total;

	}


	public static int insertTfReply(Reply reply) {

		int result = 0;

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();

			// 받는 값 꼭 기입
			result = session.insert("replies.insertTfReply", reply);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally

		return result;
	}

	public static List<Reply> myPageRepliesList(PageVO pageVO) {
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			return session.selectList("replies.myPageRepliesList", pageVO);
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		} finally {
			session.close();
		}
	}

	public static Reply selectCheckMyReply(Reply reply) {
		Reply replies = null;

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			replies = session.selectOne("replies.selectCheckMyReply", reply);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally end

		return replies;
	}// selectCheckId() end

	// 0610
	public static int deleteReply(int no) {

		int result = 0;

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();

			// 받는 값 꼭 기입
			result = session.delete("replies.deleteReply", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally
		return result;
	}

//		0618 쥬하
	public static int updateReply(Reply reply) {

		int result = 0;

		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();

			// 받는 값 꼭 기입
			result = session.update("Replies.updateReply", reply);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally

		return result;
	}

	/* model2 시작 */

	@Override
	public List<Reply> selectListMyReply(Reply reply) {
		return session.selectList("replies.selectListMyReply", reply);
	}
	
	@Override
	public List<Reply> selectListReplies(PageVO pageVO) {
		return session.selectList("replies.selectListReplies", pageVO);
	}
	//0709 승현 수정
	@Override
	public List<Reply> myPageList(PageVO pageVO) {
		return session.selectList("replies.myPageRepliesList",pageVO);
	}
	//0709 승현 수정
	
	//홍성표 0711

	@Override
	public List<Reply> selectListReplyOrderByLike(PageVO pageVO) {
		return session.selectList("replies.selectListReplyOrderByLike", pageVO);
	}
	
	@Override
	public int selectReplyImgCnt(int postNo) {
		return session.selectOne("replies.selectReplyImgCnt", postNo);
	}
	
	@Override
	public int insert(Reply reply) {
		return session.insert("replies.insert", reply);
	}
	
	@Override
	public int selectRepliesTotal(int postNo) {
		return session.selectOne("replies.selectRepliesTotal", postNo);
	}
	
	@Override
	public int delete(int replyNo) {
		return session.delete("replies.delete", replyNo);
	}
	
	@Override
	public int selectCookBucketCnt(int postNo) {
		// TODO Auto-generated method stub
		return session.selectOne("replies.selectCookBucketCnt",postNo);
	}
	
}
